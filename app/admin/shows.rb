ActiveAdmin.register Show do
  controller do
    def create
      if start_batch?
        save_batch_attrs(params[:show])
        flash[:notice] = 'You are now in batch mode!'
        redirect_to new_admin_show_path
      else
        create!
      end
    end

    def new
      @show = Show.new(batch_attrs) if batch_attrs.present?
      new!
    end

    protected

      def start_batch?
        params[:start_batch].present?
      end
      helper_method :start_batch?

      def batch_mode?
        start_batch? || batch_attrs.present?
      end
      helper_method :batch_mode?

      def batch_attrs
        session[:batch][:show] rescue nil
      end

      def save_batch_attrs(attrs)
        session[:batch] ||= { }
        session[:batch][:show] = attrs
      end

      def resource
        show = super

        if ['new', 'edit'].include?(params[:action])
          3.times do
            show.performances.build
            show.performances.last.build_artist
            show.performances.last.build_instrument
          end if show.performances.empty?

          3.times do
            show.videos.build
          end if show.videos.empty?
        end

        show
      end

      def scoped_collection
        super.select('shows.*, count(videos.id) as video_count').joins("LEFT JOIN videos on shows.id = videos.show_id").group('shows.id')
      end
  end

  sidebar :batch_mode

  index do
    column :group_name
    column :when
    column :cover_charge
    column :venue
    column :search_and_restore
    column :featured
    column :video_count, :sortable => 'video_count' do |show|
      link_to show.video_count, admin_videos_path(:q => { :show_id_eq => show.id })
    end
    column :created_at
    column :updated_at

    default_actions
  end

  form :partial => 'form'

  #form do |f|
  #  f.inputs do
  #    f.input :venue, :input_html => {:'data-placeholder' => 'Select a venue...', :class => 'chzn-select'}
  #    f.input :group_name
  #    f.input :when
  #    f.input :cover_charge
  #    f.input :description
  #    f.input :search_and_restore
  #    f.input :featured
  #  end

  #  f.has_many :performances do |p|
  #    p.inputs "Choose an existing artist" do
  #      p.input :artist, :name => 'artist', :input_html => {:'data-placeholder' => 'Choose an artist...', :class => 'chzn-select'}
  #    end

  #    # FIXME
  #    # shouldn't have to build the records here
  #    if p.object.new_record?
  #      p.object.build_artist
  #      p.inputs :name, :for => :artist, :name => 'Add a new artist'
  #    end

  #    last = p.inputs 'Choose an existing instrument' do
  #      p.input :instrument, :input_html => {:'data-placeholder' => 'Choose an instrument...', :class => 'chzn-select'}
  #    end

  #    if p.object.new_record?
  #      p.object.build_instrument
  #      p.inputs :name, :for => :instrument, :name => 'Add a new instrument'
  #    else
  #      last
  #    end
  #  end

  #  f.has_many :videos do |v|
  #    v.inputs do
  #      v.input :title, :hint => 'If left blank, this will be automatically populated from the title of the vimeo video. It can be edited afterwards.'
  #      v.input :url, :hint => 'Paste the vimeo link here; e.g. http://vimeo.com/25519509' 
  #    end
  #  end

  #  f.buttons
  #end
end

