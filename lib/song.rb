require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if artist != nil
      self.artist=(artist)
    end

    if genre != nil
      self.genre=(genre)
    end
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def artist=(this_artist)
      @artist = this_artist
      # self.artist.add_song(self)
      @artist.add_song(self)
  end


  def save
    @@all << self
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  # def self.find_by_name(name)
  #   @@all.find { |song| song.name == name }
  # end
  #
  # def self.find_or_create_by_name(name)
  #   if self.find_by_name(name) != nil
  #     self.find_by_name(name)
  #   else
  #     self.create(name)
  #   end
  # end

  def self.new_from_filename(file_name)
    file_array = file_name.chomp(".mp3").split(" - ")
    this_song = Song.find_or_create_by_name(file_array[1])
    this_artist = Artist.find_or_create_by_name(file_array[0])
    this_genre = Genre.find_or_create_by_name(file_array[2])
    this_song.artist=(this_artist)
    this_song.genre=(this_genre)
    this_song
  end

  def self.create_from_filename(file_name)
    Song.new_from_filename(file_name)
  end

end
