# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PitchDeck, type: :model do
  describe 'Associations' do
    it { should belong_to(:user) }
  end

  describe 'validation' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(200) }
    it { should validate_presence_of(:document) }
  end

  describe 'Enums' do
    it do
      is_expected.to define_enum_for(:image_process).with_values(
        open: 0,
        inprogress: 1,
        finished: 2
      )
    end
  end

  describe 'callbacks' do
    it 'run split document job' do
      expect do
        create(:pitch_deck)
      end.to change(SplitPitchDeckDocumentWorker.jobs, :size).by(1)
    end
  end
end
