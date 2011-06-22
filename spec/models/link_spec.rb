require 'spec_helper'

describe Link do
  it { should validate_presence_of(:url) }
  it { should validate_format_of(:url).with(URI.regexp) }
end
