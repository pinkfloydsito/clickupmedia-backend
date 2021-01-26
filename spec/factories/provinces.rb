# == Schema Information
#
# Table name: provinces
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :province do
    name { "" }
  end
end
