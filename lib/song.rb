require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  def artist=(artist)
    @artist = artist
    if @artist != nil
      @artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if @genre != nil
      if !@genre.songs.include?(self)
        @genre.songs << self
      end
    end

  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    Song.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil
      # new_song = self.create(name)
      song = self.create(name)
    else
      # Song.find_by_name(name)
      song = Song.find_by_name(name)
    end
    song
  end

  def self.new_from_filename(filename)

    parsed_file_name = filename.split("-")
    song_name = parsed_file_name[1].strip
    artist_name = parsed_file_name[0].strip
    genre_name = parsed_file_name[2].strip.strip.gsub(".mp3","")

    if Song.find_by_name(song_name) == nil
      song_artist = Artist.find_or_create_by_name(artist_name)
      song_genre = Genre.find_or_create_by_name(genre_name)

      new_song = Song.new(song_name, song_artist, song_genre)
      new_song
    end
  end

  def self.create_from_filename(filename)
    created_song = Song.new_from_filename(filename)
    created_song.save
  end


end
