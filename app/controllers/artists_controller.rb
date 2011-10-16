class ArtistsController < ApplicationController
  def index
    @artists = Artist.with_state(:live).includes([:instrument, 
                                                  :buy_links,
                                                  { :upcoming_shows => :venue }]).search(params[:search])
  end

  def show
    @page_class     = 'layout-1 section-artists page-show'
    @artist         = Artist.find(params[:id], :include => :instrument)
    @videos         = @artist.
                        videos.
                        order_by_show_date.
                        group_by_show.
                        includes(:show => [:venue, { :performances => [:artist, :instrument] }]).all
    @selected_video = @videos.first
    @more_videos    = 'More videos for this artist:'

    render :layout => 'videos'
  end
end
