class Publication < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization

  has_many :editions

  def share_path
    Rails.root.join('share', 'publications', id.to_s)
  end
end
