class Admin::PublicationsController < ApplicationController

  before_filter :authenticate_admin!

  def index
    @publications = Publication.all
  end

  def show
    @publication = Publication.find_by_slug(params[:id])
  end


  def destroy
    @publication = Publication.find_by_slug(params[:id])
    @publication.destroy
    redirect_to action: :index
  end

  def new_edition
    @publication = Publication.find_by_slug(params[:id])
  end

end
