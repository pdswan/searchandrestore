class VideosController < ApplicationController
  before_filter :find_video

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
