# == Schema Information
#
# Table name: guests
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  comment_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Guest < ApplicationRecord
  belongs_to :comment
end
