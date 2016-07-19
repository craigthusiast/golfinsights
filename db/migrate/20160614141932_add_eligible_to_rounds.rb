class AddEligibleToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :handicap_eligible, :boolean
  end
end
