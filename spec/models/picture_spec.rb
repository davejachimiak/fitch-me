require 'spec_helper'

describe Picture do
  it { should validate_presence_of :url }
  it { should allow_mass_assignment_of :url }
  it { should validate_uniqueness_of :url }
end
