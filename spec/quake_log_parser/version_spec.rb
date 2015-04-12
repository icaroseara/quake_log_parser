require 'spec_helper'

describe QuakeLogParser do
  describe "version" do
    it { expect(QuakeLogParser::VERSION).not_to be nil }
  end
end
