require 'pry'
class Artist
    extend Concerns::Findable
    attr_accessor :name
    @@all = []

  def initialize(name)
    @name = name
    self.save
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    created_artist = self.new(name)
    created_artist.save
    created_artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == self
      unless @songs.include?(song)
        @songs << song
      end
    elsif song.artist == nil
      song.artist = self
      unless @songs.include?(song)
        @songs << song
      end
    end
  end

  def genres
    # option when fix artist method:
    # genre_array = self.songs.collect {|song| song.genre}
    # genre_array.uniq
    genres = []
    Song.all.each do |song|
      if song.artist == self
        genres << song.genre
      end
    end
    return genres.uniq
  end
end
