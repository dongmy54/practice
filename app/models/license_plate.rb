# == Schema Information
#
# Table name: license_plates
#
#  id             :bigint(8)        not null, primary key
#  license_number :string
#  supplier_id    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# 牌照
class LicensePlate < ApplicationRecord
  # 自定义验证为单数
  validate :license_number_can_not_include_dmy 

  belongs_to :supplier
  has_one    :license_history

  def license_number_can_not_include_dmy
    errors.add(:base, '不能包含dmy') if license_number.include?('dmy')
  end

end
