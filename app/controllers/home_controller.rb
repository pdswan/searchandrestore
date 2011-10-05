class HomeController < ApplicationController
  before_filter :find_about, :only => [:index, :about]

  def index
    @homepage     = Homepage.last || 
      Homepage.new(:exciting_news => 'Add some exciting news dudes!')
    @about        = About.last || 
      About.new(:about => 'Add some about text dudes!')
    @top_picks    = Show.featured.today.limit(5)

    @featured_video = @homepage.video(:includes => [:show, { :performances => [:artist, :instrument] }])

    @featured_video ||= Video.
      order_by_show_date.
      includes(:show, { :performances => [:artist, :instrument] }).
      first

    @featured_video_description = @homepage.video_description
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

  def about
    @press_clippings = PressClipping.
      order('date DESC').
      includes(:link).
      limit(5)
  end

  protected

    def find_about
      @about ||= (About.last || About.new(:about => 'Add some about dudes!'))
    end
end
