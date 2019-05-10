require 'pry'
class Genre
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  attr_accessor :name, :songs, :artist
  @@all = []
  def initialize (name)
    @name = name
    @songs = []
  end
  def self.all
    @@all
  end
end
