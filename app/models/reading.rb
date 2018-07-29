# == Schema Information
#
# Table name: readings
#
#  id         :bigint(8)        not null, primary key
#  article_id :integer
#  person_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Reading < ApplicationRecord
  belongs_to :article
  belongs_to :person
end
