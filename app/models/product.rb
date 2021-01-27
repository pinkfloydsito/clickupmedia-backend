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
class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :color, presence: true
  validates :price, presence: true
  validates :name, presence: true
  has_and_belongs_to_many :stores
  belongs_to :category

  validates_inclusion_of :size, :in => %w(small medium large),
    :message => "%{value} is not a valid size"
end
