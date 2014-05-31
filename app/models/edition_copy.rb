class EditionCopy < ActiveRecord::Base
  belongs_to :user
  belongs_to :edition
end
