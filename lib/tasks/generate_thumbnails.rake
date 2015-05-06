# Generate a thumbnail for each edition
#
# Usage:
#
#     rake generate_thumbnails
#
task generate_thumbnails: :environment do

  Rails.logger.info "Generateing thumbnails for editions"

  Edition.find_each do |edition|
    make_thumbnail_action = MakeThumbnailAction.new(edition)
    make_thumbnail_action.make_thumbnail!
  end

end
