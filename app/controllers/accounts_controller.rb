class AccountsController < ApplicationController

  before_filter :authenticate_user!

  def show
    redirect_to :account_wallet
  end

  def wallet
    @wallet = current_user.wallet
  end

  def purchases
    @wallet = current_user.wallet
  end

  def change_password
  end

  def publications
    @publications = current_user.publications
  end

end
