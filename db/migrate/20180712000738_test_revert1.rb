# 加载反转迁移文件
require_relative '20180711123922_remove_foreign_key_category_id'

class TestRevert1 < ActiveRecord::Migration[5.1]
  def change
    revert RemoveForeignKeyCategoryId # 这里应该是迁移的类
  end
end
