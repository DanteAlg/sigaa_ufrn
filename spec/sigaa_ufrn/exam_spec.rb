require "spec_helper"

RSpec.describe SigaaUfrn::Exam, vcr: true do
  let(:exam) { described_class.new('985c690a-9879-4868-bc58-706d5b353152', 'bearer') }

  describe '#open' do
    it 'return open exams' do
    end
  end
end
