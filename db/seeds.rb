# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

COURSE_LIST = ["Math 101", "English 101", "Science 101", "Social Studies 101", "Health 101", "Chemistry 101", "English 201", "Math 201"]
GRADE_LIST = [ 1, 1.5, 2, 2.5, 3, 3.5, 4 ]

courses = []

COURSE_LIST.each { |c| courses << Course.create!( name: c ) }

500.times do |i|
  # long term - use FactoryGirl for this
  s = Student.create!(
    first_name:     Faker::Name.first_name,
    last_name:      Faker::Name.last_name,
    email:          Faker::Name.last_name + i.to_s + "@#{Faker::Internet.domain_name}"
  )

  # Adds 2-6 classes for each student and a random grade
  courses.sample(rand(2..6)).each { |c| c.grades.create!(student_id: s.id, grade: GRADE_LIST.sample) }
end
