# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.

# 都是数组
# 这里的参数 会被过滤掉 用FILTERED 替换 日志中和rails s 中都会被替换掉 
Rails.application.config.filter_parameters += [:password]
# 重定向过滤
Rails.application.config.filter_redirect = ['sub.dev:3000/users',/pravite_path/]

