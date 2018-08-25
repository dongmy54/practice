# 直接渲染成 json 格式
# {"income":"660.0","expense":"143.0","account_id":36}
json.income(@balance.income)
json.expense(@balance.expense)
json.account_id(@balance.account_id)
