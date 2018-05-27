# frozen_string_literal: true

# A participant in the quiniela
class User < ApplicationRecord
  has_many :bets, dependent: :destroy

  validates :uid, uniqueness: true

  def self.find_or_create_from_auth_hash(hash)
    logger.info hash.inspect
    user = find_or_initialize_by uid: hash[:uid]
    user.tap { |u| u.name = hash[:info][:name] }
        .tap(&:save)
  end
end
