# frozen_string_literal: true

class SplitPitchDeckDocumentWorker
  include Sidekiq::Worker

  def perform(pitch_deck_id)
    pitch_deck = PitchDeck.find_by(id: pitch_deck_id)
    # byebug
    return if pitch_deck.blank?

    ConvertDocumentToImagesService.new(pitch_deck).call
  end
end
