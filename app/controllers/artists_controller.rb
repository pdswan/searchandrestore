class ArtistsController < ApplicationController
  def index
    @artists = Artist.with_state(:live).includes([:instrument, 
                                                  :buy_links,
                                                  { :upcoming_shows => :venues }]).search(params[:search])
  end

  def show
    @has_video      = true
    @artist         = Artist.find(params[:id], :include => :instrument)
    @videos         = @artist.
                        videos.
                        order_by_show_date.
                        group_by_show.
                        includes(:show => [:venue, { :performances => [:artist, :instrument] }]).all
    @selected_video = @videos.shift
  end
end
