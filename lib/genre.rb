require 'pry'
class Genre
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
    created_genre = self.new(name)
    created_genre.save
    created_genre
  end

  def songs
    @songs
  end

  def add_song(song)
  #   unless @songs.include?(song)
  #     @songs << song
  #  end
  # end
    if song.genre == self
      unless @songs.include?(song)
        @songs << song
      end
    elsif song.genre == nil
      song.genre = self
      unless @songs.include?(song)
        @songs << song
      end
    end
  end

  def artists
    artist_array = self.songs.collect {|song| song.artist}
    artist_array.uniq
  end



end
