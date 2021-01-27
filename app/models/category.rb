# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  has_many :keywords, inverse_of: :category
  has_many :products

  accepts_nested_attributes_for :keywords
  accepts_nested_attributes_for :products, reject_if: :all_blank
end
