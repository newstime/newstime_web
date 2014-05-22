class PublicationsController < ApplicationController

  before_action :authenticate_user!, only: :subscribe

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.create(publication_params)
  end

  def subscribe
    @publication = Publication.find(params[:id])
    current_user.subscribe_to_publication(@publication)
    redirect_to :back
  end

end
