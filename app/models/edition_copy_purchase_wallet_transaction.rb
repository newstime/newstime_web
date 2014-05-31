class EditionCopyPurchaseWalletTransaction < WalletTransaction
  belongs_to :wallet
  belongs_to :edition_copy
  has_one :edition, through: :edition_copy
  has_one :publication, through: :edition

  def desc_html
    <<-HTML
      Purchase
      #{ActionController::Base.helpers.link_to edition.name, edition.url}
      of
      #{ActionController::Base.helpers.link_to publication.name, publication.url}
    HTML
  end
end
