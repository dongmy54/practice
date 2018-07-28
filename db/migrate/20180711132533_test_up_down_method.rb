class TestUpDownMethod < ActiveRecord::Migration[5.1]

  # 执行本迁移时 会执行up方法
  # 回滚时 则执行down方法
  def up
    create_table :distributors do |t|
      t.string :zipcode
    end

    # excute 应该是一种方法
    # zipcheck 应该是给约束命名
    execute <<-SQL
      alter table distributors
        add constraint zipcheck 
        check (char_length(zipcode)=5);
    SQL

    add_column :users, :home_page_url, :string
    rename_column :users,:home_page_url,:home_page_urls
  end

  def down
    rename_column :users,:home_page_urls,:home_page_url
    remove_column :users, :home_page_url

    execute <<-SQL
      alter table distributors
        drop constraint zipcheck
    SQL

    drop_table :distributors
  end
end
