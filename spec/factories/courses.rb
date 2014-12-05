require 'faker'

FactoryGirl.define do
  factory :course do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraphs.join }
  end

end
