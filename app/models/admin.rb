class Admin < ActiveRecord::Base
  devise :database_authenticatable, :timeoutable, :registerable
end
