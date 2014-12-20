FactoryGirl.define do
  factory :media_page do |f|
    f.name "Cool Link"
    f.content "http://www.neillsilva.com"
  end

  factory :invalid_media_page, parent: :media_page do |f|
    f.name nil
  end
end
