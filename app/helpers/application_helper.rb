module ApplicationHelper

  def performance_link(performance, *options)
    link_to_if(performance.artist.live?,
               "#{performance.artist.name}(#{performance.instrument.present? ? performance.instrument.name : performance.artist.instrument.name})", 
               performance.artist,
               *options)
  end

end
