FactoryGirl.define do
  factory :club do
    name "Boxclub"
    sequence(:contact_mail) {|n| "info@bc#{n}.de"}
    password "secret"
    password_confirmation "secret"
  end
end