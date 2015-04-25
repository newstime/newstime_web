class Admin::PagesController < ApplicationController

  def dashboard
    #@newsrack = Newsrack.last
    #@editions = @newsrack.try(:editions)

    @stats = {}
    @stats[:user_count] = User.count
    @stats[:admin_count] = Admin.count
  end


end
