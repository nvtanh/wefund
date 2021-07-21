# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET /' do
    context 'when unauthorized access' do
      before { get :index }

      it { expect(response).to redirect_to(new_user_session_path) }
    end

    context 'when login as an User' do
      let!(:user) { create(:user) }
      let!(:pitch_deck) { create(:pitch_deck, :finished, user: user) }

      before do
        sign_in(user)
        get :index
      end

      it { expect(response).to have_http_status(:success) }
      it { expect(assigns(:pitch_decks)).to eq [pitch_deck] }
    end
  end
end
