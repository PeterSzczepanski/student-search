class StudentPresenter < BasePresenter
  def as_h(*)
    {
      "id"    =>  @object.id,
      "first" =>  @object.first_name,
      "last"  =>  @object.last_name,
      "email" =>  @object.email,
      "average_gpa"    => @object.average_gpa,
      "studentClasses" => @object.grades.map { |g| {
        "id"    => g.course_id,
        "name"  => g.course.name,
        "grade" => g.grade,
        }
      }
    }
  end
end
