class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist # utilizes our .artist method below if user assigns an artist.
    self.genre = genre if genre # utilizes our .genre method below if the user assigns a genre.
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
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist # Sets the value of the artist.
    artist.add_song(self) # Adds itself to the artists collection of songs.
  end

  def genre=(genre)
    @genre = genre # Sets the value of the genre.
    if !(genre.songs.include?(self)) # Searches the gerne's song array to see if it includes any instances of itself.
      genre.songs << self # If not, the genre is added to the songs array.
    end
  end

  def self.find_by_name(song)
    @@all.find{|song_name| song_name.name == song}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) # If the song exists in our 'all', a truthy value will be returned. If it's true...
      self.find_by_name(name) # We then return the Song object once the title is put in our find_by_name method
    else # But if our find_by_name returns a falsey ('nil') value, indicating the song is not in our array...
      self.create(name) # Our method utilizes our '.create' method to create the song if it is not found.
    end
  end

  def self.new_from_filename(filename)
    file = filename.gsub(".mp3", "")
    artist, song, genre = file.split(" - ")
    song_artist = Artist.find_or_create_by_name(artist)
    song_genre = Genre.find_or_create_by_name(genre)
    song_new = Song.new(song, song_artist, song_genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap{|song_name| song_name.save}
  end

end
