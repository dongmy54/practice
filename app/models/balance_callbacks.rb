class BalanceCallbacks  # 回调类 没有继承
  def self.after_destroy(balance)
    puts "#{balance.id}号 账单被删除了"
  end
end