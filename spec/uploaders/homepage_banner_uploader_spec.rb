require 'spec_helper'
require 'carrierwave/test/matchers'

describe HomepageBannerUploader do
  include CarrierWave::Test::Matchers

  let(:model) { stub(:id => 1) }
  let(:uploader) { HomepageBannerUploader.new(model, :image) }
  let(:original_file_path) { File.expand_path(File.join('..', 'fixtures', 'undead.jpg'), File.dirname(__FILE__)) }
  let(:original_image) { CarrierWave::Test::Matchers::ImageLoader.load_image(original_file_path) }

  before do
    HomepageBannerUploader.enable_processing = true
    uploader.store! File.open(original_file_path)
  end

  after do
    HomepageBannerUploader.enable_processing = false
    uploader.remove!
  end

  it 'should resize the image to a width of 630 while retaining the aspect ratio' do
    expected_width  = 630
    expected_height = expected_width * original_image.height / original_image.width

    uploader.should have_dimensions(expected_width, expected_height)
  end
end
