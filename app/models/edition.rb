class Edition
  include Mongoid::Document
  include Mongoid::Paperclip

  field :name, type: String
  field :path, type: String
  field :created_at, type: Time
  field :publish_date, type: Date
  field :fmt_price,    type: String  # Formatted price string
  field :volume_label, type: String  # Formatted price string

  has_mongoid_attached_file :cover

  belongs_to :organization

  belongs_to :publication, inverse_of: :editions
end
