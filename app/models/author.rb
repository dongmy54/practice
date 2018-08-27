# == Schema Information
#
# Table name: authors
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Author < ApplicationRecord
  # -> {select :published_at} 主键仍然为返回
  # 关联中 readonly 只是表示 不能通过本model去保存相关model
  # 关联作用域 可以多个方法串起
  # where 中为hash 时，默认通过author创建的book active 为 false
  has_many :books,#-> {where(active: false).readonly(true).order('published_at desc')},
            :inverse_of => :author,
            :dependent => :nullify,
            before_add: [:association_callback1,:association_callback2]

 
 # 在执行@author.books.clear时 也会参考dependent 关联
 # 在拥有许多 这里建立关联删除
 # destroy 执行回调
 # delete_all 不执行回调
 # nullify 把关联外键设为nil
 # restrict_with_exception 炮异常
 # restrict_with_error 返回false

  accepts_nested_attributes_for :books, allow_destroy: true#, reject_if: lambda {|attributes| 
    #attributes['name'].blank? }
    # reject_if 防止创建空记录
    # reject_if: :all_blank 所有空字段都会拒绝（除_destroy)

  # 这个方法主要用于 应用来一次性 从父对象 保存多个子对象的
  # h = {:name => '测地', books_attributes: [
  #        {published_at: Time.now},
  #        {published_at: 3.day.ago}
  #  ]}
  # Author.create(h)

  # h = {name: '名字改',
  #      books_attributes: [
  #        {id: 35,published_at: 2.day.ago},
  #        {id: 36,published_at: 10.day.ago}
  #      ]}
  # a.attributes = h 可以更新 

  # 删除
  # h = {books_attributes: [
  #     {id: 35, _destroy: true}
  # ]}
  # author.attributes = h
  # author.save

  # 关联回调 还有 after_add/before_remove/after_remove
  #  方法必须要设定参数
  def association_callback1(book)
    puts '执行关联回调1'
  end

  def association_callback2(book)
    puts '执行关联回调2'
  end

  

  
end
