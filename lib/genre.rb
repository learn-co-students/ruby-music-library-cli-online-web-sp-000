require_relative "./concerns/findable.rb"

class Genre
  
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    song.genre = self if !song.genre
    self.songs << song if !self.songs.include?(song)
  end
  
  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    self.new(name).tap {|i| i.save}
  end
  
  def artists
    songs.map {|song| song.artist}.uniq
  end
  
end