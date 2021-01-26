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
class Keyword < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :category
end
