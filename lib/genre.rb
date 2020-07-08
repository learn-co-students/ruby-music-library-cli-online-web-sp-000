require 'pry'


class Genre

  # extend Memorable
  extend Findable::ClassMethods
  include Findable::InstanceMethods

  attr_accessor :name


 @@all = []

def initialize(name)
  @name = name
  save
end

def save
  @@all << self
end


def self.all
  return @@all
end

end
