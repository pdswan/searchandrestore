class ArtistsController < ApplicationController
  def index
    @artists = Artist.with_state(:live).includes(:instrument).order("artists.name ASC")
  end

  def show
  end
end
