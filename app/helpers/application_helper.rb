module ApplicationHelper

  def performance_link(performance, *options)
    instrument = if performance.instrument.present?
                   performance.instrument.name
                 elsif performance.artist.instrument.present?
                   performance.artist.instrument.name
                 end

    link_to_if(performance.artist.live?,
               "#{performance.artist.name}#{instrument ? "(#{instrument})" : ""}", 
               performance.artist,
               *options)
  end

end
