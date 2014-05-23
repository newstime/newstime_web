class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :publication

  def pricef
    price
  end

end
