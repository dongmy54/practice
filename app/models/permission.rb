# == Schema Information
#
# Table name: permissions
#
#  id             :bigint(8)        not null, primary key
#  action         :string
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  ancestry       :string
#  ancestry_depth :integer          default(0)
#

class Permission < ApplicationRecord
  # 树形结构组织 
  has_ancestry cache_depth: true # 每个节点缓存深度

end
