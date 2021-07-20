# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def pitch_deck_uploaded(email, pitch_deck_title)
    @email = email
    @pitch_deck_title = pitch_deck_title

    mail(to: @email, subject: '[Wefund] Pitch deck uploaded')
  end
end
