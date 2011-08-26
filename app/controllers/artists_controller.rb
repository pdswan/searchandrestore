class ArtistsController < ApplicationController
  def index
    @artists = Artist.with_state(:live).includes(:instrument).search(params[:search])
  end

  def show
  end
end
