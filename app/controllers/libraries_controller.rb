class LibrariesController < ApplicationController

  before_filter :authenticate_user!

  def show
    @library = {}

    # Get all the editions the user has license to.
    # The have a "Copy on record" with us.
    # They will essential need a license.
    # I suppose we are going to need a standard license to comply with the law.
    # Content creators could use our license.
    # I suppose this is the end user license.
    # This license frees the information, and allows it for transmit on our
    # system, and to where ever it is going.
    @editions = current_user.editions
  end

end
