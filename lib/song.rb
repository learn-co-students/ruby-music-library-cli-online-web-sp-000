class Song
  
  attr_accessor :name, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist= artist
    end
    if genre != nil
      self.genre= genre
    end
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
    created_song = self.new(name)
    created_song.save
    created_song
  end
  
  def artist
    @artist
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      find_by_name(song_name)
    else new_song = self.create(song_name)
      # self.all << new_song
      new_song
    end
  end
  
  def self.new_from_filename(filename)
    # **why do we use a class method here vs an instance method?**
    song = filename.split(" - ")
    new_artist_instance = Artist.find_or_create_by_name(song[0])
    new_genre_instance = Genre.find_or_create_by_name(song[2].split(".")[0])
    new_song_from_filename = new(song[1], new_artist_instance, new_genre_instance)
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
  
end