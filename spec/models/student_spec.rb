require 'rails_helper'

RSpec.describe Student, :type => :model do
  let(:student) { FactoryGirl::build( :student ) }
  context("Validations") do
    it { should validate_presence_of( :name ) }
    it { should have_many(:courses) }
  end
end
