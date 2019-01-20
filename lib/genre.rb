require 'pry'
class Genre
  extend Concerns::Findable
  extend Concerns::ClassMethods
  include Concerns::InstanceMethods
  attr_accessor :name 
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def artists
    self.songs.collect { |song| song.artist }.uniq
  end
  
  def self.all 
    @@all
  end 
  
end