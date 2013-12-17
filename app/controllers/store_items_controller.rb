# Responsible for render and authorizaing the deleiver of newstand editions.
class StoreItemsController < ApplicationController
  #before_filter :authenticate_reader!

  def show
    @edition = Edition.new
  end
end
