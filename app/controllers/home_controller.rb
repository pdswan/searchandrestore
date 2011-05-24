class HomeController < ApplicationController

  def index
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
