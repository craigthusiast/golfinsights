class ChangeRatingColumnInCourses < ActiveRecord::Migration
  def change
    change_column :courses, :rating, :float
  end
end
