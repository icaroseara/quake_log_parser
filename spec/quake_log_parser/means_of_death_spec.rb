require 'spec_helper'

describe QuakeLogParser do
  describe 'means_of_death' do
    it { expect(QuakeLogParser::MEANS_OF_DEATH).to have(29).means_of_death }
  end
end
