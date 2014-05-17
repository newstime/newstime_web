class ProfilesController < ApplicationController

  before_filter :force_trailing_slash, only: ['show']

  def show
  end

end
