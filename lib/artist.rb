class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
     artist_name = Artist.new(name)
     artist_name.save
     artist_name
   end

   def songs
     @songs
   end

  #  def add_song(song)
  #    @songs << song
  #    song.artist = self
  #  end

end
