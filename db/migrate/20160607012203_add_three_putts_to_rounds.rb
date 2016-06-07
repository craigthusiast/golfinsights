class AddThreePuttsToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :three_putts, :integer
  end
end
