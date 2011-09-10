class ShowsController < ApplicationController
  before_filter :set_date

  def index
    @uses_datepicker = true
    @shows           = Show.search(params[:search])
    @current_date    = params[:search][:for_day].respond_to?(:strftime) ?
      params[:search][:for_day] : Time.zone.parse(params[:search][:for_day])

    @upcoming_search_and_restore_shows = Show.upcoming.search_and_restore.limit(5)
  end

  protected

    def set_date
      params[:search] ||= { }
      if params[:search][:for_day].blank?
        params[:search][:for_day] = Date.today
      end
    end
end
