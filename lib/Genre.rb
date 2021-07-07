require 'pry'
class Genre
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    #@artists = []
  end

  def self.all
    @@all
  end

  def self.destroy_all           #=> clears all genres from the saving array.
    @@all.clear
  end

  def save                        #=> pushes the instance onto the saving array.
    @@all<<self
  end

  def self.create(name)           #=> generates a new song with a name and pushes it onto the saving array.
     new_genre = self.new(name)
     new_genre.save
     new_genre
  end

  def add_song(song)
    @songs<<song
  end

  def songs
    @songs
  end

  def artists
    @artists = self.songs.collect{|song| song.artist}.uniq
    #binding.pry
  end

  def self.sort_genres
    count = 1
    sorted_array = self.all.uniq.sort_by {|genre| genre.name}
    sorted_array.collect do |i|
      puts "#{count}. #{i.name}"
      count += 1
    #  binding.pry
    end
  end

 end
