class VenuesController < ApplicationController

  def index
    @venues = Venue.scoped
  end

end
