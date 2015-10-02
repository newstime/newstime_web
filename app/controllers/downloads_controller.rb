class DownloadsController < ApplicationController

  def download
    @edition = Edition.find(params[:edition_id])

    download_name = "#{@edition.publication.name}, #{@edition.name}.zip"
    send_file @edition.zip_share_path,
      filename: download_name,
      disposition: 'inline'
  end
end
