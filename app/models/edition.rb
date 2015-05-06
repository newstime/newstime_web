class Edition < ActiveRecord::Base

  belongs_to :organization
  belongs_to :publication
  belongs_to :user

  has_and_belongs_to_many :users

  scope :most_recent, -> { order('publish_date DESC') }

  # Paperclip
  #has_attached_file :cover

  # Returns the path to where edition is saved on disk.
  def share_path
    Rails.root.join('share', 'editions', id.to_s)
  end

  def thumbnails_path
    share_path.join('thumbnails')
  end

  def zip_share_path
    share_path.join(zip_name)
  end

  # Ensure that the share path exists on disk.
  def ensure_share_path!
    FileUtils.mkdir_p(share_path) unless share_path.exist?
  end

  def url
    "#{publication.url}/#{slug}"
  end

  def free?
    price <= 0
  end

  def download_url
    url + "/downloads?edition_id=#{id}"
  end

  def read_now_url
    url + "/main.html"
  end

  def cover_url
    url + "/cover.png"
  end

  def thumbnail_url
    #url + "/thumbnail.png"
    cover_url
  end

end
