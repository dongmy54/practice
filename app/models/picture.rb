# == Schema Information
#
# Table name: pictures
#
#  id             :bigint(8)        not null, primary key
#  name           :string
#  imageable_id   :integer
#  imageable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Picture < ApplicationRecord
  # 多态 属于别名
  belongs_to :imageable, :polymorphic => true
end
