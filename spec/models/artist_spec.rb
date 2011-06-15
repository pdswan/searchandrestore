require 'spec_helper'

describe Artist do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:bio) }
end
