class VenuesController < ApplicationController

  def index
    @uses_gmap = true
    @venues    = Venue.scoped
  end

end
