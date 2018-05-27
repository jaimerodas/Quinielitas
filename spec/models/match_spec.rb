# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Match, type: :model do
  subject { described_class.new }

  context 'validations' do
    it 'should run presence validations' do
      subject = described_class.new
      expect(subject.valid?).to be false
      expect(subject.errors.messages.keys).to(
        include(:home_team, :away_team, :playtime)
      )
    end
  end

  describe '#status' do
    subject do
      described_class.new(
        home_team: 'Mexico', away_team: 'Argentina', playtime: 1.month.from_now
      )
    end

    it 'is ready in the beginning' do
      expect(subject.status).to eq :ready
    end

    it 'is being_played when playtime is in the past' do
      subject.playtime = Time.zone.now
      expect(subject.status).to eq :being_played
    end

    it 'is finished once there are results' do
      subject.home_team_score = 2
      subject.away_team_score = 0
      expect(subject.status).to eq :finished
    end
  end
end
