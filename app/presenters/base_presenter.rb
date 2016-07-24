class BasePresenter
  def initialize(object)
    @object = object
  end

  def as_h
    raise 'as_h called on parent.'
  end
end