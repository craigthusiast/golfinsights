class AddColumnsToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :score, :integer
    add_column :rounds, :fairways, :integer
    add_column :rounds, :gir, :integer
    add_column :rounds, :putts, :integer
    add_column :rounds, :adjusted_score, :integer
  end
end
