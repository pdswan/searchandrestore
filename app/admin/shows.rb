ActiveAdmin.register Show do
  
  form do |f|
    f.inputs do
      f.input :venue
      f.input :group_name
      f.input :when
      f.input :cover_charge
      f.input :description
    end

    f.has_many :performances do |p|
      p.inputs :artist, :name => 'Choose an existing artist'

      # FIXME
      # shouldn't have to build the records here
      if p.object.new_record?
        p.object.build_artist
        p.inputs :name, :for => :artist, :name => 'Add a new artist'
      end

      last = p.inputs :instrument, :name => 'Choose an existing instrument'

      if p.object.new_record?
        p.object.build_instrument
        p.inputs :name, :for => :instrument, :name => 'Add a new instrument'
      else
        last
      end
    end

    f.buttons
  end
end

Admin::ShowsController.class_eval do

  protected

    def resource
      show = super

      if ['new'].include?(params[:action])
        3.times do
          show.performances.build
          show.performances.last.build_artist
          show.performances.last.build_instrument
        end
      end

      show
    end
end
