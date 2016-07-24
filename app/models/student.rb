class Student < ActiveRecord::Base
  has_many :grades
  has_many :courses, through: :grades
end
