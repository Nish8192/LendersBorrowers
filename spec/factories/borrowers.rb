FactoryGirl.define do
  factory :borrower do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    password ""
    reason "MyString"
    description "MyText"
    needed 1
    raised 1
  end
end
