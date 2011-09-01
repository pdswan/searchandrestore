require 'spec_helper'

describe Artist do
  it { should validate_presence_of(:name) }

  context "the artist is in the live state" do
    subject { Factory.build(:artist, :state => 'live') }

    it { should validate_presence_of(:bio) }
  end

  context "there are 2 artists which share a show" do
    let(:artist) { Factory(:live_artist_with_upcoming_shows) }
    let(:associate) { Factory(:live_artist) }
    let(:non_associate) { Factory(:live_artist) }
    
    before do
      Factory(:performance, :artist => associate,
                            :show   => artist.upcoming_shows.first)
    end

    describe "#associated_artists" do
      it "should include associate" do
        artist.associated_artists.should include(associate)
      end

      it "should not include non-associate" do
        artist.associated_artists.should_not include(non_associate)
      end
    end
  end
end
