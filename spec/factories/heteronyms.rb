# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :heteronym do
    word nil
    bopomofo "MyString"
    bopomofo2 "MyString"
    pinyin "MyString"
  end
end
