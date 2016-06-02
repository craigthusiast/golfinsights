class AddRoundRefToHoles < ActiveRecord::Migration
  def change
    add_reference :holes, :round, index: true, foreign_key: true
  end
end
