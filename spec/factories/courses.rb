require 'faker'

FactoryGirl.define do
  factory :course do
    name Faker::Name.name
  end

end