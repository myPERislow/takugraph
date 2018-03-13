FactoryBot.define do
  factory :user do
    email "aaa@example.com"
    password "password"
    role "member"

    factory :photographer do
      role "photographer"
    end

    factory :admin do
      role "admin"
    end
  end
end
