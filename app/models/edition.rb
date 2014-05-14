class Edition
  include Mongoid::Document
  include Mongoid::Paperclip

  #before_save :set_slug

  field :name, type: String
  field :slug, type: String
  field :created_at, type: Time
  field :zip_name, type: String
  field :publish_date, type: Date
  field :fmt_price,    type: String  # Formatted price string
  field :volume_label, type: String  # Formatted price string

  has_mongoid_attached_file :cover

  belongs_to :organization

  belongs_to :publication, inverse_of: :editions

  # Returns the path to where edition is saved on disk.
  def share_path
    Rails.root.join('share', 'editions', id.to_s)
  end

  def zip_share_path
    share_path.join(zip_name)
  end

  # Ensure that the share path exists on disk.
  def ensure_share_path!
    FileUtils.mkdir_p(share_path) unless share_path.exist?
  end

  # TODO: Move to decorator...
  def cover_url
    "/#{publication.slug}/#{slug}/cover.png"
  end


end
