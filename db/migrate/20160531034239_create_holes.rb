class CreateHoles < ActiveRecord::Migration
  def change
    create_table :holes do |t|
      t.integer :number
      t.integer :par
      t.boolean :fairway
      t.boolean :green
      t.integer :putts
      t.integer :missed_driver
      t.integer :missed_fairway_metal
      t.integer :missed_rescue
      t.integer :missed_iron_long
      t.integer :missed_iron_mid
      t.integer :missed_iron_short
      t.integer :missed_chip
      t.integer :missed_pitch
      t.integer :missed_sand
      t.integer :missed_putt_long
      t.integer :missed_putt_mid
      t.integer :missed_putt_short
      t.integer :penalties

      t.timestamps null: false
    end
    
  end
end
