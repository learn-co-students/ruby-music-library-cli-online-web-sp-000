require 'pry'
class Genre

  extend Concerns::Findable
  attr_accessor :name, :musiclibrarycontroller, :musicimporter

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def artists
    answer = []
    @songs.each do |song|
      answer << song.artist unless answer.include?(song.artist)
    end
    answer
  end

#class Method
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(genre)
     new_genre = Genre.new(genre)
     new_genre.save
     new_genre
  end

end