class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @@all
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
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
   self.new(name).tap do|song|
     song.save
   end
 end

 def artist=(artist)
   @artist = artist
   artist.add_song(self)
 end

 def genre=(genre)
   @genre = genre
   if genre.songs.include?(self)
     nil
   else
     genre.songs << self
   end
 end

 def self.find_by_name(name)
   @@all.detect do |song|
     if song.name == name
       song
     else
       nil
     end
   end
 end

 def self.find_or_create_by_name(name)
   song = self.find_by_name(name)
   if song
    return song
   else
     self.create(name)
   end
 end
end
