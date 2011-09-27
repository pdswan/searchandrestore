class HomeController < ApplicationController

  def index
    @top_picks = Show.featured.today.limit(5)
  end

  def shows
    @uses_datepicker = true
  end

  def venues
    @uses_gmap = true
  end
  def venues_landing
    @uses_gmap = true
  end

  def video
    @has_video = true
  end

  def artists
    @has_video = true
  end

end
