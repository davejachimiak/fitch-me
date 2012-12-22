FactoryGirl.define do
  sequence :url do |n|
    "https://dropbox.com/dave/fitch_slap#{n}"
  end

  factory :picture do
    url
  end
end
