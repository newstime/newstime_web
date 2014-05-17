class ProfilesController < ApplicationController

  before_filter :force_trailing_slash, only: ['show']

  def show
    @profile = Profile.find_by_slug(params[:slug])
  end

end
