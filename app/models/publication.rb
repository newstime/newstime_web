class Publication < ActiveRecord::Base
  has_and_belongs_to_many :users

  belongs_to :user
  belongs_to :organization

  has_many :editions

  def share_path
    Rails.root.join('share', 'publications', id.to_s)
  end

  def latest_edition
    editions.order(created_at: :desc).first
  end

  def url
    "/#{slug}"
  end

  def subscription_pricef
    subscription_price
  end

  def to_param
    slug
  end

end
