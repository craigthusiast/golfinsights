class RemoveCourseRefToRounds < ActiveRecord::Migration
  def change
     remove_reference :rounds, :course
  end
end
