class NewsOrganizationInquiriesController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def new
  end

  def create
    name = params[:name]
    email = params[:email]
    organization = params[:organization]

    # Send email
    # TODO: Put in background, using sidekiq
    NewsOrganizationInquiriesMailer.delay.new_inquiry(name, email, organization)

    redirect_to action: :success
  end

  def success
  end

end
