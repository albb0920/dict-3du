# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quote do
    source "MyString"
    content "MyString"
    definition_id 1
  end
end
