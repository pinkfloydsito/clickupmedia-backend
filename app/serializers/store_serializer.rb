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
#  number     :string
#
class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :street, :city, :country, :zip_code, :number
  has_many :products
end
