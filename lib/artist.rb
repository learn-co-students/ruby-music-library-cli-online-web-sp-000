require 'pry'
include Concerns::Findable

class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.songs
    @songs
  end

  def add_song(song)
    if !@songs.include?(song)
      @songs << song

      if song.artist != self
        song.artist = self
      end
    end
  end

  def genres
    genres = self.songs.collect {|song| song.genre}
    genres.uniq
  end

  # def self.new_from_filename(name)
  #   name = parse(name)
  #   # name = name.chomp!(".mp3")
  #   # name = name.split(" - ")
  #   # binding.pry
  #   find_or_create_by_name(name[0])
  # end

end
