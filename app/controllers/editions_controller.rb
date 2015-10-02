require 'fileutils'

class EditionsController < ApplicationController

  skip_before_filter :verify_authenticity_token, only: :create

  before_filter :force_trailing_slash, only: 'show'

  #before_action :authenticate_user!, only: :purchase

  def show
    @publication = Publication.find_by(slug: params[:publication_slug])
    @edition = @publication.editions.find_by(slug: params[:edition_slug])
    not_found unless @edition
  end

  def new
    @edition = Edition.new
  end

  def create
    zip = params.require(:zip)

    # Look up the publication, identified by the slug in the url.
    @publication = Publication.find_by(slug: params[:publication_slug])

    if @publication.editions.where(slug: params[:edition_slug]).exists?
      # Edition exists, receive updates
      @edition = Edition.find_by(slug: params[:edition_slug])

      @edition.size = edition_params[:size].to_f
      @edition.size_units = edition_params[:size_units].to_s

      @edition.save

    else
      # Edition doesn't exist for slug, create new edition
      @edition = Edition.new(edition_params)
      @edition.publication = @publication
      @edition.zip_name = zip.original_filename # Copy zip name to the edition.
      @edition.slug = params[:edition_slug]
      @edition.size = edition_params[:size].to_f
      @edition.size_units = edition_params[:size_units].to_s

      @edition.save
    end

    @edition.ensure_share_path!

    File.open(@edition.zip_share_path, 'wb') do |file|
      file.write(zip.read)
    end

    Rails.logger.info `rm -rf #{@edition.share_path}/extracted`
    Rails.logger.info `cd #{@edition.share_path}; unzip #{@edition.zip_name} -d extracted`

    render text: :ok
  end

  def purchase
    # Authenticate user if present.
    unless current_user
      user_params = params['user']
      if user_params
        user = User.find_by_email(user_params['email'])
        if user && user.valid_password?(user_params['password'])
          sign_in user
        end
      end
    end

    @edition = Edition.find(params[:id])
    if current_user
      unless current_user.editions.exists?(@edition)
        PurchaseEditionAction.new(current_user, @edition).preform
      end
      redirect_to :back
    else
      redirect_to checkout_edition_path(@edition)
    end
  end

  def checkout
    @edition = Edition.find(params[:id])
    redirect_to @edition.url if current_user
  end

  def search
  end

private

  def edition_params
    params.require(:edition).permit(:name, :publish_date, :price, :volume_label, :size, :size_units)
  end

end
