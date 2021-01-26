# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  name       :string
#  street     :string
#  zip_code   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city       :string
#  country    :string
#
class Store < ApplicationRecord
  has_and_belongs_to_many :products
  accepts_nested_attributes_for :products, reject_if: :all_blank
  validates :name, presence: true
  validates :street, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
end
