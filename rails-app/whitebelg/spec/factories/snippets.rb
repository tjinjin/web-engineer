FactoryGirl.define do
  factory :snippet, class: 'Snippets' do
    language "MyString"
    plain_code "MyText"
  end
end
