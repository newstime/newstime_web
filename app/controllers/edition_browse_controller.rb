require 'fileutils'

# Controller content served off read.newstime.io
class EditionBrowseController < ApplicationController

  def browse
    # Only serve off read domain
    unless request.subdomain == "read"
      redirect_to request.url.sub(request.subdomain, 'read') and return
    end

    @publication = Publication.find_by(slug: params[:publication_slug])
    @edition = @publication.editions.find_by(slug: params[:edition_slug])

    if params[:format] == 'html'
      # Check referer, is it from the content?
      unless @edition.free? || current_user.try(:owner?, @edition)
        if request.referer != request.original_url && request.referer =~ /\/#{params[:publication_slug]}\/#{params[:edition_slug]}.*\.html/
          pass_count = session[:pass_count].to_i
          if pass_count.zero?
            session[:pass_count] = 2 # Every x pages
            @continue_to = request.original_url
            render 'inbetween', status: 403, layout: false and return
          else
            # Grant pass
            session[:pass_count] = pass_count - 1
            expires_now # Prevent caching of HTML
          end
        end
      end
    end

    case "#{params[:path]}.#{params[:format]}"
    when "thumbnail.png"
      path = "#{@edition.share_path}/thumbnails/#{params[:path]}.#{params[:format]}"
      send_file path, disposition: 'inline'
    else
      send_file "#{@edition.share_path}/extracted/#{params[:path]}.#{params[:format]}", disposition: 'inline'
    end

  end

  # Redirects to same url on www domain.
  def www_redirect
    redirect_to request.url.sub(request.subdomain, 'www') and return
  end

end
