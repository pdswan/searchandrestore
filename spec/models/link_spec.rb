require 'spec_helper'

describe Link do
  it { should validate_presence_of(:url) }
  it { should validate_format_of(:url).with(URI.regexp) }

  describe "#title" do
    context "it is blank" do
      let(:link) { Factory.build(:link) }

      it "should return the url" do
        link.title.should == link.url
      end
    end
  end
end
