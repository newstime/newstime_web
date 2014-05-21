class PagesController < ApplicationController

  before_filter :force_trailing_slash, only: ['show']

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
end
