class PagesController < ApplicationController
  def home
    #@publications = Publication.all
    @editions = Edition.all
    render layout: false
  end
end
