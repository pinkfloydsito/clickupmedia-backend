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
require 'rails_helper'

RSpec.describe Keyword, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
