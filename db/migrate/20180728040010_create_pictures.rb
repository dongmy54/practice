class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string  :name
      t.integer :imageable_id     # 多态模型使用 _id _type 做区分
      t.string  :imageable_type   # 这个 imageable 在 model 中要 as 别名

      t.timestamps
    end

    # 建立 一组索引
    add_index :pictures, [:imageable_id,:imageable_type]
  end
end
