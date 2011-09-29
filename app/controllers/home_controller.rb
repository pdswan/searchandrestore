class HomeController < ApplicationController

  def index
    @homepage     = Homepage.last || Homepage.new(:exciting_news => 'Add some exciting news dudes!')
    @top_picks    = Show.featured.today.limit(5)
    @latest_video = Video.
      order_by_show_date.
      includes(:show, { :performances => [:artist, :instrument] }).
      first
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
