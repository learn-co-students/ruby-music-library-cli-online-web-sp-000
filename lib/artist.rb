require 'pry'
class Artist
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
 
  def genres 
    self.songs.collect { |song| song.genre }.uniq
  end
  
  def self.all 
    @@all
  end 
  
end