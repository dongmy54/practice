# == Schema Information
#
# Table name: paragraphs
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  section_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Paragraph < ApplicationRecord
  belongs_to :section
end
