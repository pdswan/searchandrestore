class VideosController < ApplicationController
  before_filter :find_video, :only => [:show]
  before_filter :find_videos
  before_filter :set_more_videos_title, :only => [:show]

  def index
    @video_url_params = { :search => params[:search] }
    render :layout => 'application'
  end

  def show
    @page_class = 'layout-1 section-video page-show'

    render_options = { }
    render_options.merge!(:layout => false) if request.xhr?

    render render_options
  end

  protected

    def artist_search?
      params[:search].present? && 
        params[:search].keys.any? { |key| key.to_s =~ /artist/ && params[:search][key].present? }
    end

    def venue_search?
      params[:search].present? && 
        params[:search].keys.any? { |key| key.to_s =~ /venue/ && params[:search][key].present? }
    end

    def set_more_videos_title
      @more_videos = "More videos"

      pieces = []
      pieces << "artist" if artist_search?
      pieces << "venue" if venue_search?

      @more_videos << " for this " if pieces.any?
      @more_videos << "#{pieces.join(" and this ")}:"
    end

    def find_video
      @video = Video.includes(:show => [:venue, { :performances => [:artist, :instrument] }]).find(params[:id])
    end

    def find_videos
      @videos = Video.
        order_by_show_date.
        group_by_show.
        includes(:show).
        search(params[:search]) unless request.xhr?
    end

end
