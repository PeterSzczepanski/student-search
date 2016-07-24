class StudentsPresenter < BasePresenter
  def as_h(*)
    {
      "students" => @object.map { |o| StudentPresenter.new(o).as_h },
      "classes"  => Course.all.pluck(:id, :name).to_h.stringify_keys,
    }
  end
end