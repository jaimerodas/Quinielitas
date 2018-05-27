# frozen_string_literal: true

class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :home_team, null: false
      t.string :away_team, null: false
      t.integer :home_team_score
      t.integer :away_team_score
      t.datetime :playtime, null: false

      t.timestamps
    end
  end
end
