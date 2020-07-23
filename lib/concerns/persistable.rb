module Concerns::Persistable
  module InstanceMethods
    attr_accessor :name

    def save # Instance method
      self.tap{self.class.all << self}
      # whenever you create a variable, keep the smallest scope possible (that's why using tap is good)
    end
  end

  module ClassMethods
    # variables are always scoped to the object
    # easy to control scope of method, hard to control scope of variable

    # advanced methods
    # modules don't have class methods
    # whenever a class in ruby is extended by this module,
    # this method will fire
    # base is the class itself being extended
    # self is the module that is being extended
    def self.extended(base) # Hook
      puts "#{base} has been extended by #{self}"
      # how you can have a module create a class variable
      base.class_variable_set(:@@all, [])
    end

    def destroy_all # Class method
      self.all.clear
    end

    def count # Class method
      self.all.size
    end
  end
end
