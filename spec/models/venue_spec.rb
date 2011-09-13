require 'spec_helper'

describe Venue do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:their_words) }
  it { should validate_presence_of(:our_words) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }

  describe "#save" do
    context "the venue is a new record" do
      let(:venue) { Factory.build(:venue) }

      it "should call geocode" do
        venue.should_receive(:geocode)
        venue.save
      end

      it "should set latitude and longitude" do
        venue.save
        venue.latitude.should_not be_nil
        venue.longitude.should_not be_nil
      end
    end

    context "the venue is not a new record" do
      let(:venue) { Factory.build(:venue) }
      
      before { venue.should_receive(:new_record?).at_least(1).and_return(false) }

      context "the address has changed" do
        before { venue.should_receive(:address_changed?).and_return(true) }

        it "should call geocode" do
          venue.should_receive(:geocode).and_return(true)
          venue.save
        end
      end

      context "the address has not changed" do
        before { venue.should_receive(:address_changed?).and_return(false) }

        it "should not call geocode" do
          venue.should_receive(:geocode).never
          venue.save
        end
      end
    end
  end
end
