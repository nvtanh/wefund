# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PitchDecksController, type: :controller do
  describe 'GET /pitch_decks/new' do
    context 'when unauthorized access' do
      before { get :new }

      it { expect(response).to redirect_to(new_user_session_path) }
    end

    context 'when login as an user' do
      let!(:user) { create(:user) }

      before do
        sign_in user
        get :new
      end

      it { expect(response).to have_http_status(:success) }
      it { expect(assigns(:pitch_deck)).to be_a_new(PitchDeck) }
    end
  end

  describe 'POST /pitch_decks' do
    context 'when unauthorized access' do
      before { post :create }

      it { expect(response).to redirect_to(new_user_session_path) }
    end

    context 'when login as an user' do
      let!(:user) { create(:user) }

      before do
        sign_in user
        post :create, params: params
      end

      context 'when invalid params' do
        let(:params) { { pitch_deck: { title: 'title' } } }

        it { expect(response).to render_template(:new) }
      end

      context 'when valid params' do
        let(:params) { { pitch_deck: attributes_for(:pitch_deck) } }

        it { expect(response).to redirect_to(root_path) }
      end
    end
  end
end
