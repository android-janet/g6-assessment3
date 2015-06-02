class CreateClasses < ActiveRecord::Migration
  def change
    create_table :classes do |t|
      t.string :subject
      t.references :instructor, index: true
      t.references :student, index: true
    end
    add_foreign_key :classes, :instructors
    add_foreign_key :classes, :students
  end
end
