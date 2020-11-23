class Artist
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  attr_writer :genres
  
  @@all = [ ]
  
  def initialize(name)
    @name = name
    @@all << self
    @songs = [ ]
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = [ ]
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    new_artist = Artist.new(name)
  end
    
  def add_song(song_name)
    if song_name != nil
      if song_name.artist == ""
        song_name.artist = self
      end
      if self.songs.include?(song_name) == false
        self.songs << song_name
      end
    end
  end
  
  def genres
    to_return = [ ]
    self.songs.collect do |song|
      #avoiding duplicates
      if to_return.include?(song.genre) == false
        to_return << song.genre
      end
    end
    to_return
  end
  
end
