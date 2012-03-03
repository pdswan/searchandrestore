class AboutController < ApplicationController
  
  def index
    @tabs = About.all

    @press_clippings = PressClipping.
      order('date DESC').
      includes(:link).
      limit(5)
  end

end
