module PitchDeckHelper
  def image_process_class pitch_deck
    case
    when pitch_deck.inprogress?
      "label-warning"
    when pitch_deck.finished?
      "label-success"
    else
      "label-info"
    end
  end
end
