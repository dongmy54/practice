class RemoveForeignKeyCategoryId < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :accounts,:categories  # 移除迁移
    # 在执行回滚的时候还会 验证其中外键是否正确
  end
end
