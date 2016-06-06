class AddCourseNameRefToRounds < ActiveRecord::Migration
  def change
     add_reference :rounds, :course_name, index: true, foreign_key: true
  end
end
