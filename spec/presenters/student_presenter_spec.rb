require 'rails_helper'

RSpec.describe StudentPresenter do
  let!(:student) {
    Student.create!(
      first_name: "John",
      last_name: "Smith",
      email: "test@test.local",
    )
  }
  let!(:course) { Course.create(name: "TEST 101") }
  let!(:grades_1) { student.grades.create!(course_id: course.id, grade: 4.0) }
  let!(:grades_2) { student.grades.create!(course_id: course.id, grade: 2.0) }

  describe '#as_h' do
    let(:expected_hash) do
      {"id"=>student.id,
       "first"=>"John",
       "last"=>"Smith",
       "email"=>"test@test.local",
       "average_gpa"=>3.0,
       "studentClasses"=>
        [{"id"=>course.id, "name"=>"TEST 101", "grade"=>4.0},
         {"id"=>course.id, "name"=>"TEST 101", "grade"=>2.0}]}
    end

    it 'returns formmatted results' do
      h = described_class.new(student).as_h

      expect(h).to eq expected_hash
    end
  end
end