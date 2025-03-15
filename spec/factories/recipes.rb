FactoryBot.define do
  factory :recipe do
    title { "recipe_title" }
    model { "model" }
    status { "published" }
    preheat_time { "3" }
    preheat_temperature { "180" }
    association :user
  end
end

FactoryBot.define do
  factory :heat do
    time { "3" }
    temperature { "180" }
    association :recipe
  end
end

FactoryBot.define do
  factory :tag do
    name { "tag_name" }
    association :recipe
  end
end

FactoryBot.define do
  factory :ingredient do
    name { "ingredient_name" }
    quantity { "1" }
    association :recipe
  end
end

FactoryBot.define do
  factory :instruction do
    step_number { "1" }
    description { "description" }
    association :recipe
  end
end
