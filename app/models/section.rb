# == Schema Information
#
# Table name: sections
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  document_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Section < ApplicationRecord
  belongs_to :document
  has_many   :paragraphs
end
