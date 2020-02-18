require 'pry'

module Concerns::Findable
  def find_by_name(name)
    self.all.detect {|item| item.name == name}
  end
  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end


# def self.find_or_create_by_name(name)
#   if !(self.find_by_name(name))
#     self.create(name)
#   else
#     self.find_by_name(name)
#   end
# end
# def self.find_by_name(name)
#   self.all.select {|song| song.name = self}
# en
