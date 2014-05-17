class PagesController < ApplicationController
  def home
    @editions = Edition.all.order(created_at: :desc).take(24)
  end
end
