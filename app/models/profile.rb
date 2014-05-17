class Profile < ActiveRecord::Base
end

class PublicationProfile < Profile
  belongs_to :publication
end

class UserProfile < Profile
  belongs_to :user
end

class OrganzationProfile < Profile
  belongs_to :organization
end
