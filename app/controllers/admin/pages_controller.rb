class Admin::PagesController < ApplicationController

  before_filter :authenticate_admin!, only: [:dashboard]

  def dashboard
    #@newsrack = Newsrack.last
    #@editions = @newsrack.try(:editions)

    @stats = {}
    @stats[:user_count] = User.count
    @stats[:admin_count] = Admin.count
    @stats[:publication_count] = Publication.count
    @stats[:news_organization_inquiries_count] = NewsOrganizationInquiry.count

  end


end
