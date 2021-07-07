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
     song
   else
     self.create(name)
   end
 end

 def self.new_from_filename(filename)
   song_file = filename.split(" - ")
   song_name = song_file[1]
   artist_name = song_file[0]
   genre_name = song_file[2].split(".mp3").join

   artist = Artist.find_or_create_by_name(artist_name)
   genre = Genre.find_or_create_by_name(genre_name)
   self.new(song_name, artist, genre)

 end

 def self.create_from_filename(filename)
   self.new_from_filename(filename).save
 end
end
