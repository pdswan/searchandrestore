class ArtistsController < ApplicationController
  def index
    @artists = Artist.with_state(:live).scoped(:include => [:instrument])
  end

  def show
  end
end
