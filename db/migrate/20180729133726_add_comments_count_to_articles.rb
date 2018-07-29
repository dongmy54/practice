class AddCommentsCountToArticles < ActiveRecord::Migration[5.1]
  def change
    # 评论计数器
    add_column :articles, :comments_count, :integer,default: 0,null: false
    # 为之前数据添加 计数
    Article.all.each do |article|
      article.comments_count = article.comments.size
      article.save!
    end
  end
end


