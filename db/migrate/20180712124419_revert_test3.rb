class RevertTest3 < ActiveRecord::Migration[5.1]
  def change
    revert do # revert 块中直接放 之前执行的内容。它就能反转回去
      create_table :foos do |t|
      t.string  :name
      t.integer :price
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL
          alter table foos
          add constraint Po
          check (price > 0);
        SQL
      end

      dir.down do
        execute <<-SQL
          alter table foos
          drop constraint Po;
        SQL
      end
    end

    add_index :foos,:name
    end
  end
end
