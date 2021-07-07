class Song
 attr_accessor :name
 extend Concerns::Findable
 @@all = []

 def initialize(name, artist = nil, genre = nil)
   @name = name
   self.artist = artist if artist
   self.genre = genre if genre
 end

 def self.all
   @@all
 end

 def save
   @@all << self
 end

def artist
  @artist
end

def genre
  @genre
end

def artist=(artist)
  @artist = artist
  artist.add_song(self) unless artist.songs.include?(self)
end

def genre=(genre)
  @genre = genre
  genre.songs << self unless genre.songs.include?(self)
end

 def self.destroy_all
   self.all.clear
 end

 def self.create(song_name, artist = nil, genre = nil)
   song = self.new(song_name, artist, genre)
   song.name = song_name
   song.artist= artist if artist
   song.genre = genre if genre
   song.save
   song
 end


 #def self.find_by_name(name)

# self.all.find {|song| song.name == name}
# end

 #def self.find_or_create_by_name(name)
#   self.find_by_name(name)||self.create(name)
# end

def self.new_from_filename(filename)
  filename = filename.gsub(".mp3","")
  name_arr = filename.split(" - ")
  artist = Artist.find_or_create_by_name(name_arr[0])
  genre = Genre.find_or_create_by_name(name_arr[2])
  song = self.find_or_create_by_name(name_arr[1])
  song.artist=artist
  song.genre=genre
  song
end

def self.create_from_filename(filename)
  song=self.new_from_filename(filename)
  song.save
end
end
