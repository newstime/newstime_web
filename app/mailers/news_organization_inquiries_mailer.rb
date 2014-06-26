class NewsOrganizationInquiriesMailer < ActionMailer::Base
      NewsOrganizationInquiriesMailer
  default from: "admin@newstime.io"

  def new_inquiry(name, email, organization)
    @name = name
    @email = email
    @organization = organization
    mail(to: "blakefrost@gmail.com", subject: 'New News Organization Inquiry')
  end
end
