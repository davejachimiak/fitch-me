require 'spec_helper'

describe Picture do
  it { should validate_presence_of :url }
  it { should allow_mass_assignment_of :url }
  it { should validate_uniqueness_of :url }

  describe '.random' do
    it 'selects a random picture record' do
      Picture.stubs(:order).with('random()').
        returns OpenStruct.new(first: 'cool')

      expect(Picture.random).to eq 'cool'
    end
  end
end
