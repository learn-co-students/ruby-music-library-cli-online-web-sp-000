module Findable
  module ClassMethods


    def create(name)
      self.new(name)
    end

    # def create(name)
    #   return self.new(name)
    # end
    def find_by_name(name)
      all.detect{|a| a.name == name}
    end

    def count
      self.all.count
    end

    def all
      return self.all
    end

    def destroy_all
      self.all.clear
    end
  end


  module InstanceMethods
    def initialize

      self.class.all << self
      @name = name
    end
  end
end
