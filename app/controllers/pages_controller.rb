class PagesController < ApplicationController
  def home
    @editions = Edition.all
  end
end
