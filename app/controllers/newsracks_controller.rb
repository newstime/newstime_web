class NewsracksController < ApplicationController

  def sprite
    send_file "share/newsracks/#{params[:path]}.#{params[:format]}", disposition: 'inline'
  end

end
