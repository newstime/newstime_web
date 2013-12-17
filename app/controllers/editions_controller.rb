class EditionsController < ApplicationController

  def index
    @editions = Edition.all
    @editions = @editions.select(&:path)
  end

  def new
    @edition = Edition.new
  end

  def create
    @edition = Edition.new(edition_params)
    if @edition.save
      redirect_to @edition, notice: "Edition created successfully."
    else
      render "new"
    end
  end

  def show
    year, month, day, path = params[:path].match(/(\d{4})\/(\d{2})\/(\d{2})\/?(.*)/).try(:captures)

    @edition = Edition.where(path: "#{year}/#{month}/#{day}").first
    send_file "share/editions/#{@edition.path}/#{path}.#{params[:format]}", type: 'text/html', disposition: 'inline'
  end

  private

  def edition_params
    params.require(:edition).permit(:name, :path, :cover)
  end

end
