class ActiveRecord::Base
  def self.new_without_protection(attrs)
    instance = self.new

    instance.assign_attributes attrs, without_protection: true
    instance
  end
end
