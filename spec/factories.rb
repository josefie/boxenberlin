# encoding: utf-8

FactoryGirl.define do
  
  sequence :contact_mail do |n|
    "info@bc#{n}.de"
  end
  
  factory :club do
    name "Boxclub"
    contact_mail {FactoryGirl.generate(:contact_mail)}
    password "secret"
    password_confirmation "secret"
  end
  
  factory :event do
    title "Boxevent"
    association :location, factory: :location
    date Date.today
    association :club, factory: :club
    contact_name "Person"
    contact_mail {FactoryGirl.generate(:contact_mail)}
  end
  
  factory :boxer do
    first_name "Boxer"
    last_name "Test"
    date_of_birth Date.today - 18.year
    association :club, factory: :club
    weight 60
    gender false
    fights_won 0
    fights_lost 0
    fights_drawn 0
    active true
  end
  
  factory :location do
    street "Straße"
    number "1"
    zip "12345"
    city "Berlin"
  end
  
end