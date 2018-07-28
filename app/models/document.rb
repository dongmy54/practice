# == Schema Information
#
# Table name: documents
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Document < ApplicationRecord
  has_many :sections
  has_many :paragraphs, :through => :sections
end
