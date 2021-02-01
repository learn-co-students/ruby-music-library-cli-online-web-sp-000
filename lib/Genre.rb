require 'pry'

class Genre
  extend Persistable::ClassMethods
  extend Concerns::Findable
  extend Nameable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name, :songs, :musiclibrarycontroller, :musicimporter
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    @new_array = []
    @songs.each do |song|
      if @new_array.include?(song.artist)
        nil
      else
        @new_array << song.artist
      end
    end
    @new_array
  end


end
