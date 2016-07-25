require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should have_many(:grades) }
  it { should have_many(:students) }

  it { should validate_presence_of(:name) }
end