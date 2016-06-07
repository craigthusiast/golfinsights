class AddHandicapDifferentialToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :handicap_differential, :decimal, precision: 3, scale: 1
  end
end
