class Edition
  include Mongoid::Document
  include Mongoid::Timestamps

  ## Attributes
  field :name,         type: String
  field :publish_date, type: Date
  field :fmt_price,    type: String  # Formatted price string
  field :volume_label, type: String  # Formatted price string

  belongs_to :organization

  has_many :editions, inverse_of: :publication
  belongs_to :publication, inverse_of: :editions

end
