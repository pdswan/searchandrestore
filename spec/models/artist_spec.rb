require 'spec_helper'

describe Artist do
  it { should validate_presence_of(:name) }

  context "the artist is in the live state" do
    subject { Factory.build(:artist, :state => 'live') }

    it { should validate_presence_of(:bio) }
  end
end
