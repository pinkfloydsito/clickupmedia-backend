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
  has_many :keywords
  has_many :products

  accepts_nested_attributes_for :keywords, reject_if: :all_blank
  accepts_nested_attributes_for :products, reject_if: :all_blank
end
