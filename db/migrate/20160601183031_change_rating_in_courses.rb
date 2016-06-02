class ChangeRatingInCourses < ActiveRecord::Migration
  def change
    change_column :courses, :rating, :decimal, precision: 3, scale: 1
  end
end
