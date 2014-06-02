class NewsracksController < ApplicationController

  def sprite
    send_file Newsrack.share_path.join("#{params[:path]}.#{params[:format]}"), disposition: 'inline'
  end

end
