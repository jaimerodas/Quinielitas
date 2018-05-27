# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create name: 'Test' }

  let(:match) do
    Match.create home_team: 'Mex', away_team: 'Bra', playtime: 1.month.from_now
  end

  it 'can only have one bet per match' do
    expect(subject.bets.create(match: match)).to be_truthy
    expect { subject.bets.create(match: match) }.to(
      raise_error ActiveRecord::RecordNotUnique
    )
  end
end
