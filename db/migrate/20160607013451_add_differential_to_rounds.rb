class AddDifferentialToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :differential, :decimal, precision: 3, scale: 1
  end
end
