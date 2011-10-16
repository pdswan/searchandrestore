class AboutController < ApplicationController
  
  def index
    @about = About.last || About.new(:about => 'Add some about text dudes!')

    @press_clippings = PressClipping.
      order('date DESC').
      includes(:link).
      limit(5)
  end

end
