ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# 加载activemodel 下模块 测试
require './lib/custome_class/person1'
require './lib/custome_class/person2'
require './lib/custome_class/person3'
require './lib/custome_class/person4'
require './lib/custome_class/email_contact'
require './lib/custome_class/person5'
require './lib/custome_class/person6'
require './lib/custome_class/person7'
require './lib/custome_class/person8'
require './lib/custome_class/mobile'
