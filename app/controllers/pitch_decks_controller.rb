# frozen_string_literal: true

class PitchDecksController < ApplicationController
  def new
    @pitch_deck ||= current_user.pitch_decks.new
  end

  def create
    @pitch_deck = current_user.pitch_decks.build(permit_params)
    if @pitch_deck.save
      flash[:success] = I18n.t('controllers.pitch_decks.create.success')
      redirect_to root_path
    else
      flash[:danger] = @pitch_deck.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def permit_params
    params.require(:pitch_deck).permit(:title, :document)
  end
end
