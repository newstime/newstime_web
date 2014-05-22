class WalletsController < ApplicationController

  before_filter :authenticate_user!

  def show
    @wallet = current_user.wallet
  end

end
