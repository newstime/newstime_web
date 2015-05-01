module Account
  class EditionsController < ApplicationController

    before_filter :authenticate_user!

    def new
      @publication = current_user.publications.find_by_slug(params[:id])
      @edition = @publication.editions.build
    end

  end
end
