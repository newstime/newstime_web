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
    @edition = Edition.where(path: params[:path]).first
    send_file "share/editions/#{@edition.path}/index.html", type: 'text/html', disposition: 'inline'
  end

  private

  def edition_params
    params.require(:edition).permit(:name, :path, :cover)
  end

end
