class PagesController < ApplicationController
  def home
    @publications = Publication.all
  end
end
