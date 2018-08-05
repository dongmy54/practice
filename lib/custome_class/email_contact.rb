class EmailContact

  # 验证 转化 翻译 名称自省 以及能与 form_for、render 其它辅助方法搭配
  include ActiveModel::Model

  attr_accessor :email,:name,:message
  validates :email,:name,:message, presence: true

  def deliver
    if valid?
      puts '发送邮件啰'
    end
  end

end

# email_contact = EmailContact.new(:name => '邮件名',
#                                  :email => '邮件地址',
#                                  :message => '邮件信息')
# 
# email_contact.valid?
# 
# email_contact.deliver
# 
# email_contact.persisted?