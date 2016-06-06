class AddCourseIndexToRounds < ActiveRecord::Migration
  def change
    add_index :rounds, :course_id
  end
end
