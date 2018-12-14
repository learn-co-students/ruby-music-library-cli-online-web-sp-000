class Genre
  attr_accessor :name, :songs
  
  extend Modules::ClassMethods
  include Modules::InstanceMethods
  extend Concerns::Findable
  
  @@all = []
  def initialize(name)
    super()
    @songs = []
    @name = name
  end
  
  def self.all
    @@all
  end
  
  def add_song(song)
    @songs << song if !@songs.include?(song)
  end
  
  def artists
    self.songs.map{|i| i.artist}.uniq
  end
end