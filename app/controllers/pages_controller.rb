class PagesController < ApplicationController

  def home
    @newsrack = Newsrack.last
    @editions = @newsrack.try(:editions)
  end

  def newsrack
    @editions = Edition.all.order(created_at: :desc).take(24)
  end

  def show
    @page = Page.find_by_path(params[:path])

    if @page
      case @page
      when PublicationProfile
        @editions = @page.publication.editions
        render :publication_profile
      else
        render @page.class.to_s.underscore
      end
    else
      render "404", status: 404
    end
  end

  def news_organization_sign_up
  end

end
