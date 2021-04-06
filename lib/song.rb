class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist_name = nil, genre = nil)
    @name = name
    self.artist= artist_name if artist_name #on this song instance (self), call artist method and define to artist_name if arg is provided
    self.genre= genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

# rspec spec/004_songs_and_artists_spec.rb
  def artist=(artist)
    @artist = artist
    artist.add_song(self) #on artist arg, call add_song on self, of this instance in Song class
  end

  def genre=(genre)
    @genre = genre
  end

# rspec spec/007_findable_songs_spec.rb
  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

# rspec spec/009_music_importer_spec.rb
   def self.new_from_filename(file) # i.e.: file = ("Thundercat - For Love I Come - dance.mp3")
    #1. Parse file from sting to array
     filename = file.split(/\ - |\./)

     #2. define elements from array
     artist_name = filename[0]#.strip
     song_name= filename[1]#.strip
     genre_name = filename[2]#.strip

     #3. create artist, genre
     artist = Artist.find_or_create_by_name(artist_name)
     genre = Genre.find_or_create_by_name(genre_name)

     #4. create song
     Song.new(song_name, artist, genre)
   end

   def self.create_from_filename(file)
     song = self.new_from_filename(file)
     song.save
   end

end
# rspec spec/001_song_basics_spec.rb
