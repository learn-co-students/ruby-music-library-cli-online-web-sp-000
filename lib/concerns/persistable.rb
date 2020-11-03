module Persistable

  module InstanceMethods
    def save
      self.class.all << self
    end
  end

  module ClassMethods
    def destroy_all
      self.all.clear
    end

    def create(name)
      o = self.new(name)
      o.save
      o
    end
  end

end
