class EditionCopyPurchase < Purchase
  include ActionView::Helpers::UrlHelper

  ## Relations
  belongs_to :edition_copy
  has_one :edition, through: :edition_copy

  ## Methods
  def desc_html
    "Edition #{link_to edition.name, edition.url}"
  end
end
