class Artist 
  
  extend Concerns::Findable

  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
    save
  end
  
  def genres 
    self.songs.collect {|song| song.genre}.uniq
  end 

  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    Artist.new(name)
  end

  
  def add_song(song)
    self.songs << song unless songs.include?(song)
     song.artist = self if song.artist.nil?
  end
    
  
end