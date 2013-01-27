# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    title "MyString"
    radical "MyString"
    stroke_count 1
    non_radical_stroke_count 1
    dict nil
  end
end
