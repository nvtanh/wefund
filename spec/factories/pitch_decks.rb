# frozen_string_literal: true

FactoryBot.define do
  factory :pitch_deck do
    title { Faker::Lorem.sentence }
    user
    document do
      Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test-document.pdf'), 'application/pdf')
    end

    trait :finished do
      image_process { PitchDeck.image_processes[:finished] }
    end

    trait :inprogress do
      image_process { PitchDeck.image_processes[:inprogress] }
    end
  end
end
