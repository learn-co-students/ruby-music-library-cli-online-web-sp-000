class Song
  
  # extend Concerns::Findable
  
  @@all = []
  
  attr_accessor :name, :artist, :genre
  
  def initialize(name, artist_oi = nil, genre_oi = nil)
    @name = name
    self.artist = artist_oi if artist_oi
    self.genre = genre_oi if genre_oi
    save
  end
  
  def artist=(artist_oi)
    @artist = artist_oi
    artist_oi.add_song(self)
  end
  
  def genre=(genre_oi)
    @genre = genre_oi
    genre_oi.songs << self unless genre_oi.songs.include?(self)
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    newSong_oi = self.new(name)
    newSong_oi
  end
  
  def self.find_by_name(name_str)
    self.all.detect {|i| i.name == name_str}
  end
  
  def self.find_or_create_by_name(name_str)
    self.find_by_name(name_str)? self.find_by_name(name_str) : self.create(name_str)
  end
  
  def self.new_from_filename(fileName_str)
    fileName_arr = fileName_str.split(" - ")
    artist_oi = Artist.find_or_create_by_name(fileName_arr[0])
    genre_oi = Genre.find_or_create_by_name(fileName_arr[2].gsub(".mp3", ""))
    song_oi = self.new(fileName_arr[1], artist_oi, genre_oi)
    song_oi
  end
  
  def self.create_from_filename(fileName_str)
    self.new_from_filename(fileName_str)
  end
  
end

  
# rspec spec/001_song_basics_spec.rb
# rspec spec/004_songs_and_artists_spec.rb
# rspec spec/005_songs_and_genres_spec.rb
# rspec spec/007_findable_songs_spec.rb
# rspec spec/009_music_importer_spec.rb