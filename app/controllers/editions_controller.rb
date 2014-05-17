require 'fileutils'

class EditionsController < ApplicationController

  skip_before_filter :verify_authenticity_token, only: :create

  def index
    @editions = Edition.all
    @editions = @editions.select(&:path)
  end

  def new
    @edition = Edition.new
  end

  def show
    #case params[:format]
    #when 'html'
      #render status: 403, text: "Access Denied"
    #else
      year, month, day, path = params[:path].match(/(\d{4})\/(\d{2})\/(\d{2})\/?(.*)/).try(:captures)

      @edition = Edition.where(path: "#{year}/#{month}/#{day}").first
      send_file "share/editions/#{@edition.path}/#{path}.#{params[:format]}", type: 'text/html', disposition: 'inline'
    #end
  end

  def create
    zip = params.require(:zip)

    # Look up the publication, identified by the slug in the url.
    @publication = Publication.find_by(slug: params[:publication_slug])

    if @publication.editions.where(slug: params[:edition_slug]).exists?
      # Edition exists, receive updates
      @edition = Edition.find_by(slug: params[:edition_slug])


    else
      # Edition doesn't exist for slug, create new edition
      @edition = Edition.new(edition_params)
      @edition.publication = @publication
      @edition.zip_name = zip.original_filename # Copy zip name to the edition.
      @edition.slug = params[:edition_slug]

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

private

  def edition_params
    params.require(:edition).permit(:name, :publish_date, :fmt_price, :volume_label)
  end

end
