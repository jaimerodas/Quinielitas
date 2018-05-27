# frozen_string_literal: true

# A bet made by a user about a particular match
class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :match
end
