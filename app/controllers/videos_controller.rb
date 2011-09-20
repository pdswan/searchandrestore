class VideosController < ApplicationController
  before_filter :find_video, :only => [:show]

  def index
    @videos = Video.
      order_by_show_date.
      group_by_show.
      includes(:show).
      search(params[:search])

    render :layout => 'application'
  end

  def show
    render_options = { }
    render_options.merge!(:layout => false) if request.xhr?
    render render_options
  end

  protected

    def find_video
      @video = Video.includes(:show => [:venue, { :performances => [:artist, :instrument] }]).find(params[:id])
    end

end
