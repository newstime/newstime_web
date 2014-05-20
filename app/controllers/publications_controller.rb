class PublicationsController < ApplicationController

  before_action :authenticate_user!, only: :subscribe

  def subscribe
    @publication = Publication.find(params[:id])
    current_user.subscribe_to_publication(@publication)
    redirect_to :back
  end

end
