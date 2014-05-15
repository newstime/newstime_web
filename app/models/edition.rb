class Edition < ActiveRecord::Base

  belongs_to :organization
  belongs_to :publication
  belongs_to :user

  # Paperclip
  #has_attached_file :cover

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
