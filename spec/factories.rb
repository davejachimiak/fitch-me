FactoryGirl.define do
  sequence :url do |n|
    "https://dropbox.com/dave/fitch_me#{n}"
  end

  factory :picture do
    url
  end
end
