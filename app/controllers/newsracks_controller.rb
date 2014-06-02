class NewsracksController < ApplicationController

  def sprite
    @newsrack = Newsrack.find(params[:id])
    send_file @newsrack.sprite_path, disposition: 'inline'
  end

end
