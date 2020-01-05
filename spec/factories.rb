FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "RspecUser#{n}@test.com"
    end
    password { "password" }
    password_confirmation { "password" }
  end

  factory :sa do
    sequence :email do |n|
      "RspecSA#{n}@test.com"
    end
    password { "password" }
    password_confirmation { "password" }
  end

  factory :admin do
    sequence :email do |n|
      "RspecADMIN#{n}@test.com"
    end
    password { "password" }
    password_confirmation { "password" }
  end

  factory :tech do
    sequence :email do |n|
      "RspecTECH#{n}@test.com"
    end
    password { "password" }
    password_confirmation { "password" }
  end

  factory :client do
    clientname { "RspecClient" }
  end

  factory :section do
    sectionname { "RspecSection" }
    association :user, :client
  end

  factory :info do
    infoname { "RspecInfo" }
    infodata { "RspecInfoDATA............" }
    association :user, :section
  end

end