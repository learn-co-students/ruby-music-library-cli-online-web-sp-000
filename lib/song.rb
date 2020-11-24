require 'pry'

class Song
  extend Concerns::Findable
  extend Concerns::Persistable::ClassMethods
  include Concerns::Persistable::InstanceMethods
  extend Concerns::Sortable::ClassMethods
  include Concerns::Sortable::InstanceMethods

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
      @artist.add_song(self)
  end

  def self.all
    @@all
  end

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
