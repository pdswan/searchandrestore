require 'spec_helper'

describe Video do
  describe "#oembed_request_url" do
    let(:video) { Video.new }

    context "the url attributes is set" do
      before do
        video.should_receive(:url).and_return('http://google.com')
      end

      it "should return the url with the oembed parameters as query string parameters" do
        video.oembed_request_url.should == 'http://google.com?height=350&width=651'
      end
    end
  end
end
