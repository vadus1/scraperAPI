FactoryGirl.define do
  factory :page do
    id ""
    url { Faker::Internet.url }
    content {{
      "a" =>  Array.new(rand(1 ..9))  { Faker::Internet.url } ,
      "h1" =>  Array.new(rand(1 .. 4)) { Faker::Lorem.sentence },
      "h2" =>  Array.new(rand(1 .. 9)) { Faker::Lorem.sentence },
      "h3" =>  Array.new(rand(1 .. 9)) { Faker::Lorem.sentence }
    }}

  end
end
