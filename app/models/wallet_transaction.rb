class WalletTransaction < ActiveRecord::Base
  belongs_to :wallet

  def desc_html
  end
end
