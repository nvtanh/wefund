# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SplitPitchDeckDocumentWorker do
  let!(:user) do
    create(:user)
  end
  let!(:pitch_deck) do
    create :pitch_deck, user: user
  end

  context 'when run worker' do
    it 'Split document and change image_process success' do
      Sidekiq::Testing.inline! do
        SplitPitchDeckDocumentWorker.perform_async(pitch_deck.id)

        pitch_deck.reload

        expect(pitch_deck.image_process).to eq 'finished'
        expect(pitch_deck.images.size).to eq 1
      end
    end
  end
end
