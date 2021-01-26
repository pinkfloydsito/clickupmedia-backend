# == Schema Information
#
# Table name: keywords
#
#  id          :bigint           not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_keywords_on_category_id  (category_id)
#
FactoryBot.define do
  factory :keyword do
    name { "MyString" }
  end
end
