class AddYardageToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :yardage, :integer, :limit => 2
  end
end
