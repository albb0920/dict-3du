class ActiveRecord::Base
  def self.has_comma_splited_fields(*args)
    args.each do |field_name|
      class_eval do
        define_method field_name do
          super().split(',')
        end
        define_method :"#{field_name}=" do |new_value|
          if new_value.respond_to? :join
            super(new_value.join(','))
          else
            super(new_value)
          end
        end
      end
    end
  end
end
