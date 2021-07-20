# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :load_resource

  def index; end

  private

  def load_resource
    @pitch_deck ||= current_user.pitch_decks.finished.includes(images_attachments: :blob).last
  end
end
