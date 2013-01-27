# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :defination do
    heteronym nil
    type 1
    self.send(:def, "MyString")
    example "MyString"
    see_entry nil
  end
end
