class Organization < ActiveRecord::Base
  #has_many :users
  has_many :editions
  has_many :publications
end
