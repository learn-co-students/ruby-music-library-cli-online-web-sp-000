class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
      if artist == nil
        @artist = artist
      else
        self.artist=(artist)
      if genre == nil
        @genre = genre
      else
        self.genre=(genre)
      end
    end
  end

  def artist=(artist)
      @artist = artist
      artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    unless genre.songs.include?(self)
    genre.songs << self
    else
    end
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
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    Song.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(file_name)
    split_filename = file_name.split(" - ")
    parsed_song_name = split_filename[1]
    parsed_artist_name = split_filename[0]
    parsed_genre = split_filename[2].split(".mp3").join
    artist = Artist.find_or_create_by_name(parsed_artist_name)
    genre = Genre.find_or_create_by_name(parsed_genre)
    self.new(parsed_song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end
