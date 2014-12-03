require 'faker'

FactoryGirl.define do
  factory :student do
    name Faker::Name.name
    email Faker::Internet.email
    cpf "933.685.985-46"
    rg "123456780"
  end

end
