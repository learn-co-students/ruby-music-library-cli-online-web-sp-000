module Persistable
  module InstanceMethods
  def save 
    self.class.all << self
  end
end 

module ClassMethods 
  def self.extended(base)
    puts "#{base} has been extended by #{self}"
  base.class_variable_set(:@@all, [])
end

  def reset_all
    self.all.clear
end

def count
 self.all.size 
end
end 
end
