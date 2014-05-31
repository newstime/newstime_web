class Purchase < ActiveRecord::Base
  belongs_to :user

  def desc_html
  end
end
