class VenuesController < ApplicationController
  before_filter :redirect_to_venue_detail, :only => :index

  def index
    @uses_gmap = true
    @venues    = Venue.scoped
  end

  def show
    @uses_gmap = true
    @venue_map = true
    @venue     = Venue.find(params[:id])
  end

  protected

    def redirect_to_venue_detail
      return true unless params[:id].present?
      redirect_to venue_path(params[:id])
    end
end
