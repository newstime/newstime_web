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
          pass_count = flash[:pass_count].to_i
          if pass_count.zero?
            flash[:pass_count] = 2 # Every x pages
            @continue_to = request.original_url
            render 'inbetween', status: 403, layout: false and return
          else
            # Grant pass
            flash[:pass_count] = pass_count - 1
          end
        end
      end
    end

    send_file "#{@edition.share_path}/extracted/#{params[:path]}.#{params[:format]}", disposition: 'inline'
  end

  # Redirects to same url on www domain.
  def www_redirect
    redirect_to request.url.sub(request.subdomain, 'www') and return
  end

end
