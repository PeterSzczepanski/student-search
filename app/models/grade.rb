class Grade < ActiveRecord::Base
  belongs_to :grade
  belongs_to :student
end
