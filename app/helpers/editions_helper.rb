module EditionsHelper

  def show_download_links
		@edition.free? || current_user.try(:owner?, @edition)
	end

end
