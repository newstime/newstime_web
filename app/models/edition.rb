class Edition
  include Mongoid::Document
  include Mongoid::Paperclip

  before_create :set_slug

  field :name, type: String
  field :slug, type: String
  field :created_at, type: Time
  field :publish_date, type: Date
  field :fmt_price,    type: String  # Formatted price string
  field :volume_label, type: String  # Formatted price string

  has_mongoid_attached_file :cover

  belongs_to :organization

  belongs_to :publication, inverse_of: :editions

  def set_slug
    self.slug = name.downcase.gsub(/[ _]/, '-')
  end

  # Returns the path to where edition is saved on disk.
  def share_path
    File.join(publication.share_path, slug.underscore)
  end
end
