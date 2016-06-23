FactoryGirl.define do
  factory :snippet, class: 'Snippets' do
    language "ruby"
    plain_code 'puts "Hello World"'
  end
end
