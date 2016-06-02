class AddCourseRefToRounds < ActiveRecord::Migration
  def change
    add_reference :rounds, :course, index: true, foreign_key: true
  end
end
