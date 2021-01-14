require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'validations' do
    subject { described_class.new(name: 'general') }

    it 'is valid' do
      expect(subject).to be_valid
    end

    it 'validates presence of name' do
      subject.name = ''

      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to eq ["Name can't be blank"]
    end

    it 'validates uniqueness of name' do
      described_class.create!(name: subject.name.upcase)

      expect(subject).to be_invalid
      expect(subject.errors.full_messages).to eq ['Name has already been taken']
    end
  end
end
