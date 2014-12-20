FactoryGirl.define do
    salt = BCrypt::Engine.generate_salt
    factory :user do |f|
        f.name "Neill Silva"
        f.email "neillnsilva@gmail.com"
        f.password "Pass1234"
        f.salt salt
        f.encrypted_password "WGergw5t34t347843tGS%Y3456$RGSf"
    end
end