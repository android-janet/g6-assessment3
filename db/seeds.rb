# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

students = Student.create([{first_name: 'Melissa', last_name: 'Khat'}, {first_name: 'Shelby', last_name: 'Kelly'}, {first_name: 'Nick', last_name: 'Student'}, {first_name: 'Jessica', last_name: 'Koch'}])

instructors = Instructor.create([{first_name: 'Bobby', last_name: 'Wilson'}])
