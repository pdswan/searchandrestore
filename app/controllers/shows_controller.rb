class ShowsController < ApplicationController
  before_filter :set_default_date
  before_filter :set_current_date
  before_filter :set_search_title

  def index
    @uses_datepicker = true
    @shows           = Show.includes([:venue, { :performances => [:artist, :instrument] }]).
                            order("shows.when ASC")

    @shows = @shows.upcoming unless @current_date
    @shows = @shows.search(params[:search])

    @upcoming_search_and_restore_shows = Show.upcoming.
                                              search_and_restore.
                                              limit(5).
                                              includes(:venue)
  end

  protected

    def set_default_date
      return true unless empty_search?

      params[:search] ||= { }
      params[:search][:for_day] = Time.now
    end

    def set_current_date
      if params[:search].has_key?(:for_day)
        @current_date = params[:search][:for_day].respond_to?(:strftime) ?
          params[:search][:for_day] : Time.zone.parse(params[:search][:for_day])
      end
    end

    def empty_search?
      return true unless params.has_key?(:search)
      params[:search].values.all?(&:blank?)
    end

    def set_search_title
      @search_title = "Search results for #{@current_date.present? ? '' : 'upcoming '}shows "

      if params[:search][:for_day].present?
        @search_title << %{on "#{@current_date.strftime("%A %B %d, %Y")}"}

      elsif params[:search][:artists_name_starts_with]
        @search_title << %{featuring artist matching "#{params[:search][:artists_name_starts_with]}"}
      elsif params[:search][:venue_id_equals]
        @search_title << %{at "#{Venue.find(params[:search][:venue_id_equals]).try(:name)}"}
      end
    end
end
