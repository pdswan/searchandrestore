require 'spec_helper'

describe PressClipping do
  it { should validate_presence_of(:source) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:link) }
end
