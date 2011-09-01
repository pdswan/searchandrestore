require 'spec_helper'

describe Video do
  describe "#oembed_request_url" do
    let(:video) { Video.new }

    context "the url attributes is set" do
      before do
        video.should_receive(:url).at_least(1).and_return('http://google.com')
      end

      it "should return the url with the oembed parameters as query string parameters" do
        video.oembed_request_url.should == 'http://google.com?height=350&width=651'
      end
    end
  end

  describe ".for_artist" do
    let(:not_an_artist) { double('not an artist') }
    let(:artist)        { Factory(:live_artist_with_upcoming_shows) }
    let(:video)         { Factory(:video, :show => artist.upcoming_shows.first) }

    it "raises an ArgumentError if the argument is not a kind of Artist" do
      expect { Video.for_artist(not_an_artist) }.
        to raise_error(ArgumentError)
    end

    context "the artist performed in the show to which the video belongs" do
      let(:video) { Factory(:video, :show => artist.upcoming_shows.first) }

      it "should include the video" do
        Video.for_artist(artist).should include(video)
      end
    end

    context "the artist has not performed in the show to which the video belongs" do
      let(:video) { Factory(:video) }

      it "should not include the video" do
        Video.for_artist(artist).should_not include(video)
      end
    end

  end
end
