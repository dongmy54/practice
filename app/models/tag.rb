# == Schema Information
#
# Table name: tags
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  belongs_to :article

  # 覆盖 默认to_param 方法
  def to_param
    rand = SecureRandom.uuid.delete('-')
    rand_number1 = rand.first(5)
    rand_number2 = rand.last(5)
    rand_number1 + id.to_s + rand_number2
  end

end
