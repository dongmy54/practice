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
  belongs_to :supplier
  has_one    :license_history
end
