require 'factory_bot'

FactoryBot.define do
  factory :user do
    username 'test'
    email 'test@test.com'
    password 123456
  end
end
