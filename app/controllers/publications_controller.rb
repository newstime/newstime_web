class PublicationsController < ApplicationController
  def index
    @publication = Publication.find_by(slug: params['publication_slug'])
  end
end
