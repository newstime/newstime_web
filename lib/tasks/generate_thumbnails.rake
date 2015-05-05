# Generate a thumbnail for each edition
#
# Usage:
#
#     rake generate_thumbnails
#
task generate_thumbnails: :environment do

  Rails.logger.info "Generateing thumbnails for editions"

  # Where are the editions stored? (In the share directory, which can be an
  # attached and mounted network data store
  # Where will the thumnail image be saved to?
  # Will it be added to the contents of the edition?

  def ensure_thumbnail(edition)
    puts edition.name
    # Process the cover image into a smaller thumbnail image
    # Put in a shadow directory with assets generated specifically for the store
    #   - (Thumbnails should exist in the main source, as convention)
    #   - This feature is to ensure thumnails can be generated.
  end


  Edition.find_each do |edition|
    puts self
    ensure_thumbnail(edition)

    #edition.generate_thumbnail

  end

end
