class SearchController < ApplicationController

  def search
    @editions = Edition.all
  end

end
