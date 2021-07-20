# frozen_string_literal: true

require 'rmagick'
include Magick

class ConvertDocumentToImagesService
  def initialize(pitch_deck)
    @pitch_deck = pitch_deck
  end

  def call
    @pitch_deck.inprogress!
    documents = ImageList.new(File.open(document_path))
    documents.each_with_index do |img, index|
      tmp_file = Tempfile.new([tmp_filename(index), '.png'])
      img.write(tmp_file.path)

      @pitch_deck.images.attach(io: tmp_file.open, filename: img_filename(index))
    end
    @pitch_deck.finished!
    UserMailer.pitch_deck_uploaded(@pitch_deck.user_email, @pitch_deck.title).deliver_later
  end

  private

  def document_path
    ActiveStorage::Blob.service.send(:path_for, @pitch_deck.document.key)
  end

  def tmp_filename(index)
    "processed_image_#{@pitch_deck.id}_#{index}"
  end

  def img_filename(index)
    "image_#{@pitch_deck.id}_#{index}.png"
  end
end
