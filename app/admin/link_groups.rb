ActiveAdmin.register LinkGroup do

  form do |f|
    f.inputs :name, :name => 'Link Group Name'

    5.times { f.object.links.build }
    f.has_many :links do |link|
      link.input :title
      link.input :url
    end

    f.buttons
  end
  
end
