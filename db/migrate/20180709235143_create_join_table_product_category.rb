class CreateJoinTableProductCategory < ActiveRecord::Migration[5.1]
  def chang
    # 链接数据表会自动创建关联字段（两个_id)
    create_join_table :products,:categories do |t|
      t.integer :product_id
      t.integer :category_id
    end
  end
end
