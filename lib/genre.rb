require 'pry'


class Genre

  # extend Memorable
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable
  include Paramable

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
