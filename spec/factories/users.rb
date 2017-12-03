FactoryGirl.define do
  pw = RandomData.random_sentence
  # #name of factory declared
  factory :user do
    name RandomData.random_name
    # # each user factory builds gets unique email
    sequence(:email){|n| "user#{n}@factory.com" }
    password pw
    password_confirmation pw
    role :member
  end
# ends factory
end
