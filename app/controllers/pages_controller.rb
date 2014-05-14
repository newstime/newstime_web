class PagesController < ApplicationController
  def home
    @publications = Publication.all
    render layout: false
  end
end
