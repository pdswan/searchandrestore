class Link < ActiveRecord::Base

  belongs_to :linkable, :polymorphic => true

  validates :url, :presence => true,
                  :format   => URI.regexp

end
