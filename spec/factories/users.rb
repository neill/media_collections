FactoryGirl.define do
    factory :user do |f|
        f.name "Neill Silva"
        f.email "neillnsilva@gmail.com"
        f.encrypted_password "Pass1234"
    end
end