class Grade < ActiveRecord::Base
  belongs_to :course
  belongs_to :student

  validates :course_id, presence: true
  validates :student_id, presence: true
  validates :grade, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 4.0 }
end
