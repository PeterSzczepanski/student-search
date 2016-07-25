class Student < ActiveRecord::Base
  has_many :grades
  has_many :courses, through: :grades

  def name
    "#{first_name} #{last_name}"
  end

  def average_gpa
    return if grades.empty?
    # if grades are in-progress and nil, ignore
    valid_grades = grades.reject { |g| g.grade.nil? }
    (valid_grades.sum(&:grade) / valid_grades.count).round(2)
  end
end
