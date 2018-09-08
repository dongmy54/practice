# == Schema Information
#
# Table name: users
#
#  id                :bigint(8)        not null, primary key
#  name              :string
#  address           :string
#  age               :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  home_page_urls    :string
#  terms_of_service  :boolean
#  email             :string
#  alisa_name        :string
#  role              :string
#  length_of_service :integer
#  guid              :string
#  password_digest   :string
#  avatar            :string
#

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
