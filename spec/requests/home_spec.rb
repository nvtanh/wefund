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

      before { sign_in(user) }

      context 'when pitch_deck is exist' do
        context 'when pitch deck has image_process is inprogress' do
          let!(:pitch_deck) { create(:pitch_deck, :inprogress, user: user) }

          before { get :index }

          it { expect(response).to have_http_status(:success) }
          it { expect(assigns(:pitch_deck)).to eq nil }
        end

        context 'when pitch deck has image_process is finished' do
          let!(:pitch_deck) { create(:pitch_deck, :finished, user: user) }

          before { get :index }

          it { expect(response).to have_http_status(:success) }
          it { expect(assigns(:pitch_deck)).to eq pitch_deck }
        end
      end
    end
  end
end
