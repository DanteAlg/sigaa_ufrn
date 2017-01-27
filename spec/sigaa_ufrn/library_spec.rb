require "spec_helper"

RSpec.describe SigaaUfrn::Library do
  let(:library) { described_class.new('985c690a-9879-4868-bc58-706d5b353152', 'bearer') }

  describe '#materials' do
    subject { library.materials }

    it 'return library materials' do
      binding.pry
    end
  end

  describe '#libraries' do
    subject { library.libraries }
  end

  describe '#articles' do
  end

  describe '#detailed_articles' do
  end

  describe '#books_loan' do
    subject { library.books_loan }
  end

  describe '#current_books_loan' do
    subject { library.current_books_loan }
  end

  describe '#current_books_loan' do
  end

  describe '#books' do
  end

  describe '#find_by_material_in_library' do
  end
end
