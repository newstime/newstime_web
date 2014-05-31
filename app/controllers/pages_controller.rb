class PagesController < ApplicationController

  def home
    @editions = Edition.all.order(created_at: :desc).take(24)
  end

  def newsrack
    @editions = Edition.all.order(created_at: :desc).take(24)
  end

  def show
    @page = Page.find_by_path(params[:path])

    if @page
      render @page.class.to_s.underscore
    else
      render "404", status: 404
    end
  end

  def news_organization_sign_up
  end

end
