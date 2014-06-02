class MakeCompositeAction


  def initialize(editions)
    @editions = editions
  end

  def make_composite!

    target_image_width = 600
    target_image_height = 376

    # 4 across
    images_per_row = 4
    # Compute size
    length = @editions.count

    rows = (length / images_per_row.to_f).ceil

    width = target_image_width * images_per_row
    height = target_image_height * rows

    # Create the output canvas image
    #`rm tmp/stitched.png`
    `convert -size #{width}x#{height} canvas:none tmp/stitched.png`

    # For each edition
    current_row = current_column = 0
    @editions.each_slice(4) do |editions|
      editions.each do |edition|
        #`composite -compose atop -geometry -13-17 white-highlight.png red-circle.png red-ball.png`
        src_image = edition.share_path.join('extracted/cover.png')
        `composite -geometry #{target_image_width}x#{target_image_height}+#{target_image_width*current_column}+#{target_image_height*current_row} #{src_image} tmp/stitched.png tmp/stitched-composed.png`
        `mv  tmp/stitched-composed.png tmp/stitched.png`
        current_column+=1
      end
      current_column=0; current_row+=1
    end
    #
    #   Keep track of x y position
    #   Compose image

  end

end
