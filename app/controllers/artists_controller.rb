class ArtistsController < ApplicationController
  def index
    @artists = Artist.with_state(:live).includes([:instrument, 
                                                  :buy_links,
                                                  { :upcoming_shows => :venues }]).search(params[:search])
  end

  def show
    @has_video = true
    @artist = Artist.find(params[:id], :include => :instrument)
  end
end
