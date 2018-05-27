# frozen_string_literal: true

class CreateBets < ActiveRecord::Migration[5.2]
  def change
    create_table :bets do |t|
      t.references :user, foreign_key: true
      t.references :match, foreign_key: true
      t.integer :home_team_score, null: false, default: 0
      t.integer :away_team_score, null: false, default: 0
      t.integer :points
      t.timestamps

      t.index %i[user_id match_id], unique: true
    end
  end
end
