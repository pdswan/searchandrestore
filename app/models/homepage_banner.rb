class HomepageBanner < ActiveRecord::Base
  mount_uploader :image, HomepageBannerUploader
end
