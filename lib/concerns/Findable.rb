require 'pry'

module Concerns::Findable 
  def find_by_name(name)
    self.all.select {|item| item.name == name} 
  end 
  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
    # if !(self.find_by_name(name))
    #   self.new(name)
    # else 
    # self.find_by_name(name)
    #end 
  end 
end 