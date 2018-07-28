# == Schema Information
#
# Table name: model_accounts
#
#  id         :bigint(8)        not null, primary key
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
module A
  class ModelAccount < ApplicationRecord
    belongs_to :model_supplier
  end
end

