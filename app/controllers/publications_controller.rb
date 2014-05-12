class PublicationsController < ApplicationController

  before_filter :force_trailing_slash, only: ['index', 'show']

  skip_before_filter :verify_authenticity_token, only: :create

  def index
    @publication = Publication.find_by(slug: params[:publication_slug])
  end

  def show
    @publication = Publication.find_by(slug: params[:publication_slug])
    @edition = @publication.editions.find_by(slug: params[:edition_slug])
  end

  def browse
    @publication = Publication.find_by(slug: params[:publication_slug])
    @edition = @publication.editions.find_by(slug: params[:edition_slug])
    send_file "#{@edition.share_path}/extracted/#{params[:path]}.#{params[:format]}", disposition: 'inline'
  end

end
