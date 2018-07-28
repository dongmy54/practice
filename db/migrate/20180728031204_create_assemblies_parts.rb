class CreateAssembliesParts < ActiveRecord::Migration[5.1]
  def change
    say '没有model，把id 禁用了'
    create_table :assemblies_parts,:id => false do |t|
      t.integer :part_id
      t.integer :assembly_id
    end
    add_index :assemblies_parts, :part_id
    add_index :assemblies_parts, :assembly_id
  end
  # 没有model 创建数据
  # sql = "insert into assemblies_parts (part_id,assembly_id) values (1,1),(1,2),(2,1)"
  # ActiveRecord::Base.connection.execute(sql)
end
