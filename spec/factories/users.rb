require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email { generate :user_email }
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.now
    # verified_at Time.now
    # organizations [FactoryGirl.create(:organization), FactoryGirl.create(:organization), FactoryGirl.create(:organization)]
  end

  sequence :user_email do |n|
    "fg_user_#{n}@gmail.com"
  end
end
