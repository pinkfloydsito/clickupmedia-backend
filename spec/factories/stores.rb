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
FactoryBot.define do
  factory :store do
    name { "" }
    street { "" }
    zip_code { "" }
  end
end
