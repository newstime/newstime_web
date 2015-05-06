
class MakeThumbnailAction

  def initialize(edition)
    @edition = edition
  end

  def make_thumbnail!

    share_path = @edition.share_path
    thumbnails_path = @edition.thumbnails_path

    thumbnail_filename = "tmp/thumbnail_#{(0...8).map { (65 + rand(26)).chr }.join}.png"
    thumbnail_composed_filename = "tmp/thumbnail_composed_#{(0...8).map { (65 + rand(26)).chr }.join}.png"

    thumbnail_width  = 600
    thumbnail_height = 376

    # Create a blank thumbnail image, to the correct height and width
    `convert -size #{thumbnail_width}x#{thumbnail_height} canvas:none #{thumbnail_filename}`


    src_image = @edition.share_path.join('extracted/cover.png')
    `composite -geometry #{thumbnail_width}x#{thumbnail_height} #{src_image} #{thumbnail_filename} #{thumbnail_composed_filename}`

    FileUtils.mkdir_p @edition.thumbnails_path # Ensure path.

    FileUtils.mv thumbnail_composed_filename, "#{@edition.thumbnails_path}/thumbnail.png"

  end

end
