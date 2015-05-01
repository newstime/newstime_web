module Account
  class PublicationsController < ApplicationController

    before_filter :authenticate_user!

    def index
      @publications = current_user.publications
    end

    def show
      @publication = current_user.publications.find_by_slug(params[:id])
    end


    def destroy
      @publication = current_user.publications.find_by_slug(params[:id])
      @publication.destroy
      redirect_to action: :index
    end

    def new_edition
      @publication = current_user.publications.find_by_slug(params[:id])
    end

  end
end
