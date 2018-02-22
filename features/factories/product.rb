def upload_image(image_name, product: nil)
  pi = ProductImage.find_or_create_by(product: product, original_filename: image_name)
  pi.image = Rails.root.join("db/seeds/images/#{image_name}").open
  pi.save
end


FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Product #{n}" }
    price 4.99
    list_price { price + 2 }
    category
    after(:create) do |product, factory|
      upload_image("stardew_001.jpg", product: product)
    end
  end
end
