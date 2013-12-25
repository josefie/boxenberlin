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
    address "Berlin, Germany"
    date Date.today
    association :club, factory: :club
    contact_name "Person"
    contact_mail {FactoryGirl.generate(:contact_mail)}
  end
  
end