class PagesController < ApplicationController
  def home
    @editions = Edition.all
    render layout: false
  end
end
