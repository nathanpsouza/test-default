require 'rails_helper'

RSpec.describe Student, :type => :model do
  context("Validations") do
    it { should validate_presence_of( :name ) }
    it { should validate_presence_of( :rg ) }
    it { should validate_presence_of( :cpf ) }

    it { should validate_presence_of( :email ) }

    it { should have_many( :courses ).through( :enrollments ) }

    it "validate cpf" do
      student = FactoryGirl.build(:student)
      student.cpf = '111.111.111-11'
      expect(student).to_not be_valid
    end

    it "validate email" do
      student = FactoryGirl.build(:student)
      student.email = 'invalid'
      expect(student).to_not be_valid
    end
  end
end
