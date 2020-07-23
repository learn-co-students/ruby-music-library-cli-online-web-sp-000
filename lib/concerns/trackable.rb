module Concerns::Trackable
  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def create(name)
      new_object = self.new(name)
      new_object.save
      new_object
    end
  end

  module InstanceMethods
    def save
      self.class.all << self
    end
  end
end
