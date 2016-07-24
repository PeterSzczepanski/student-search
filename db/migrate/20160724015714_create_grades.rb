class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :student_id, null: false
      t.integer :course_id, null: false
      t.float :grade, precision: 2, scale: 1

      t.timestamps null: false
    end
  end
end
