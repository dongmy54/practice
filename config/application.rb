require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.time_zone = 'Beijing'
    #config.active_record.error_on_ignored_order = true    # 排序错误是否忽略
    # ActiveRecord::Base.lock_optimistically = false # 不只是把异常关掉，还会让后者可以更新记录

    # 净化保留 标签
    config.action_view.sanitized_allowed_tags = 'table', 'tr', 'td', 'button'
    # 设置可用的本地 
    #config.i18n.available_locales = :special
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
