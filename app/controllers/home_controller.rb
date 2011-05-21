class HomeController < ApplicationController

  def index
  end

  def shows
    @uses_datepicker = true
  end

  def venues
    @uses_gmap = true
  end
end
