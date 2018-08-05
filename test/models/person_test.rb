# == Schema Information
#
# Table name: people
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  surname    :string
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # include ActiveModel::Lint::Tests    # 此模块 作用

  setup do
    @model = Person.new
  end
  # test "the truth" do
  #   assert true
  # end
end
