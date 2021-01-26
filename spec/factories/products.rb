# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  color       :string
#  size        :string
#  price       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
FactoryBot.define do
  factory :product do
    name { "" }
    color { "" }
    size { "" }
    price { 1.5 }
  end
end
