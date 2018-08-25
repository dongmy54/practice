# 渲染成 xml 格式
xml.div {
  xml.h3('xml 测试')
  xml.p("第一笔收入: #{@balance.income}")
}
xml.em('第一行')
xml.em{ xml.b("块表示嵌套")}
xml.a("链接", 'href' => "http://www.baidu.com")
xml.target("name" => "compile", "option" => 'falo')

xml.div {
  xml.h3('循环处理')
  for balance in @balances
    xml.balance do
      xml.income(balance.income)
      xml.expense(balance.expense)
      xml.account_id(balance.account_id)
      xml.created_at(balance.created_at)
    end
  end
}