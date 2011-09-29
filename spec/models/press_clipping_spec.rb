require 'spec_helper'

describe PressClipping do
  it { should validate_presence_of(:source) }
  it { should validate_presence_of(:author) }
end
