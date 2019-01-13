class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
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

   def add_song(song) #if song already belongs to an artist, do not assign to an artist
     @songs << song unless songs.include?(song)
     song.artist = self unless song.artist
   end

   def genres
     self.songs.collect {|song| song.genre}.uniq
   end

end
