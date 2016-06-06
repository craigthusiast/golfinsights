class AddMoreColumnsToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :missed_driver, :integer
    add_column :rounds, :missed_fairway_metal, :integer
    add_column :rounds, :missed_rescue, :integer
    add_column :rounds, :missed_iron_long, :integer
    add_column :rounds, :missed_iron_mid, :integer
    add_column :rounds, :missed_iron_short, :integer
    add_column :rounds, :missed_chip, :integer
    add_column :rounds, :missed_pitch, :integer
    add_column :rounds, :missed_sand, :integer
    add_column :rounds, :missed_putt_long, :integer
    add_column :rounds, :missed_putt_mid, :integer
    add_column :rounds, :missed_putt_short, :integer
    add_column :rounds, :penalties, :integer
  end
end