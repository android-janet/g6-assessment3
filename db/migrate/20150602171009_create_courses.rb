class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :subject
      t.references :student, index: true
      t.references :instructor, index: true
    end
    add_foreign_key :courses, :students
    add_foreign_key :courses, :instructors
  end
end
