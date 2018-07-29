class AddTestColumnToAssembilesParts < ActiveRecord::Migration[5.1]
  def change
    # PS rails 中无alter_table
    # has_and_belongs_to 中间表中 通过关联并没有把外键其它列 显示出来
    add_column :assemblies_parts,:test_column,:string,:default => 'hello'
  end
end
