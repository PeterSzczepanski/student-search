require 'rails_helper'

RSpec.describe Grade, type: :model do
  it { should belong_to(:course) }
  it { should belong_to(:student) }

  it { should validate_presence_of(:student_id) }
  it { should validate_presence_of(:course_id) }

  it { should_not allow_value(-0.1).for(:grade) }
  it { should_not allow_value(4.1).for(:grade) }
  it { should validate_numericality_of(:grade) }
  it { should allow_value(2.0).for(:grade) }
end