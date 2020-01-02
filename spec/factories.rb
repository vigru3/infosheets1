FactoryBot.define do
  factory :sa do
    sequence :email do |n|
      "RspecSA#{n}@test.com"
    end
    password { "password" }
    password_confirmation { "password" }
    type { "Sa" }
  end

  factory :admin do
    sequence :email do |n|
      "RspecADMIN#{n}@test.com"
    end
    password { "password" }
    password_confirmation { "password" }
    type { "Admin" }
  end

  factory :tech do
    sequence :email do |n|
      "RspecTECH#{n}@test.com"
    end
    password { "password" }
    password_confirmation { "password" }
    type { "Tech" }
  end

  factory :client do
    clientname { "RspecClient"}
  end

end