class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :par
      t.integer :rating
      t.integer :slope
      t.boolean :favourite
      t.string :tees

      t.timestamps null: false
    end
  end
end
