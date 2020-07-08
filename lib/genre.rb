require 'pry'


class Genre

  # # extend Memorable
  # extend Findable::ClassMethods
  # include Findable::InstanceMethods

  attr_accessor :name


 @@all = []

def initialize(name)
  @name = name
  @songs = []
  save
end

def songs
return @songs
end

def save
  @@all << self
end


def self.all
  return @@all
end

def self.create(name)
return self.new(name)
end

def self.destroy_all
@@all.clear
end

end
