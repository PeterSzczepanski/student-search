require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'shoulda matchers' do
    it { should have_many(:grades) }
    it { should have_many(:courses) }
  end

  let(:student) { Student.create!(first_name: "John", last_name: "Smith", email: "test@example.com") }

  describe '#name' do
    it 'returns student\'s full name' do
      expect(student.name).to eq "John Smith"
    end
  end

  describe '#average_gpa' do
    let(:course_1) { Course.create(name: "Test 101") }
    let(:course_2) { Course.create(name: "Test 102") }

    let!(:grade_1) { student.grades.create(course_id: course_1.id, grade: 4.0) }
    let!(:grade_2) { student.grades.create(course_id: course_2.id, grade: 2.0) }
    let!(:grade_3) { student.grades.create(course_id: course_2.id, grade: nil) }

    it 'calculates average correctly' do
      expect(student.average_gpa).to eq 3.0
    end
  end
end