# == Schema Information
#
# Table name: assemblies
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Assembly < ApplicationRecord
  has_and_belongs_to_many :parts
end
