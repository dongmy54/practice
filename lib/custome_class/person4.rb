class Person4
  # 命名
  extend ActiveModel::Naming
end

# Person4.model_name.name          # => "Person4"
# Person4.model_name.singular      # => "person4" 单数
# Person4.model_name.plural        # => "person4s" 复数
# Person4.model_name.element       # => "person4"
# Person4.model_name.human         # => "Person4"
# Person4.model_name.collection    # => "person4s"
# Person4.model_name.param_key     # => "person4"
# Person4.model_name.i18n_key      # => :person4
# Person4.model_name.route_key     # => "person4s"
# Person4.model_name.singular_route_key  # => "person4"