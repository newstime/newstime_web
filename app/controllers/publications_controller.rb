class PublicationsController < ApplicationController

  before_action :authenticate_user!, only: [:subscribe, :manage]

  #def index
    #@publications = current_user.publications
  #end

  def show
    @publication = Publication.find_by_slug(params[:id])
    @editions = @publication.editions
    @latest_edition = @publication.latest_edition
    render 'publications/publication_profile'
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.create(publication_params)
    redirect_to account_publications_url
  end

  def subscribe
    @publication = Publication.find(params[:id])
    current_user.subscribe_to_publication(@publication)
    redirect_to :back
  end

private

  def publication_params
    params.require(:publication).permit(:name, :slug)
  end

end
