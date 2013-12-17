class PagesController < ApplicationController
  def home
    @latest_edition = Edition.last
  end
end
