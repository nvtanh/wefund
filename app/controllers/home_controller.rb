# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :load_resources

  def index; end

  private

  def load_resources
    @pitch_decks ||= current_user.pitch_decks.newest.includes(images_attachments: :blob)
  end
end
