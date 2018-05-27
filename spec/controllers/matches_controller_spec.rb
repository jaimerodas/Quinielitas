# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MatchesController, type: :controller do
  subject do
    Match.create home_team: 'A', away_team: 'B', playtime: 1.month.from_now
  end

  let(:create_params) do
    { home_team: 'C', away_team: 'D', playtime: 1.month.from_now }
  end
  let(:update_params) { { home_team: 'B', away_team: 'C' } }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to be_successful
    end
  end

  describe '#new' do
    it 'returns http success' do
      get :new
      expect(response).to be_successful
    end
  end

  describe '#create' do
    it 'returns http success' do
      expect(post(:create, params: { match: create_params })).to(
        redirect_to(matches_path)
      )
    end
  end

  describe '#edit' do
    it 'returns http success' do
      get :edit, params: { id: subject.id }
      expect(response).to be_successful
    end
  end

  describe '#update' do
    it 'returns http success' do
      expect(put(:update, params: { id: subject.id, match: update_params })).to(
        redirect_to(matches_path)
      )
    end
  end

  describe '#destroy' do
    it 'returns http success' do
      expect(delete(:destroy, params: { id: subject.id })).to(
        redirect_to(matches_path)
      )
    end
  end
end
