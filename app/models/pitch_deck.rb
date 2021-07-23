# frozen_string_literal: true

class PitchDeck < ApplicationRecord
  belongs_to :user
  has_one_attached :document
  has_many_attached :images

  enum image_process: {
    open: 0,
    inprogress: 1,
    finished: 2
  }

  delegate :email, to: :user, prefix: true

  validates :title, presence: true, length: { maximum: 200 }
  validates :document, presence: true

  after_create :split_images_from_document

  scope :newest, -> { order('id DESC') }

  private

  def split_images_from_document
    SplitPitchDeckDocumentWorker.perform_at(20.seconds.from_now, id)
  end
end
