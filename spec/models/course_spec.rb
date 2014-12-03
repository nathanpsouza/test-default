require 'rails_helper'

RSpec.describe Course, :type => :model do
  context("Validations") do
    it { should validate_presence_of( :name ) }
    it { should have_many( :students ).through( :enrollments ) }
  end
end
