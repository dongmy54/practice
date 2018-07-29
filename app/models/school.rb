# == Schema Information
#
# Table name: schools
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class School < ApplicationRecord
  has_many :teachers
end
