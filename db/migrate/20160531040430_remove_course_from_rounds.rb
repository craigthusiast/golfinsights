class RemoveCourseFromRounds < ActiveRecord::Migration
  def change
    remove_column :rounds, :course
  end
end
