class DownloadsController < ApplicationController

  def download
    @edition = Edition.find(params[:edition_id])
    send_file @edition.zip_share_path, disposition: 'inline'
  end
end
