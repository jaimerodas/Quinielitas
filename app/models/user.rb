# frozen_string_literal: true

# A participant in the quiniela
class User < ApplicationRecord
  has_many :bets, dependent: :destroy
end
