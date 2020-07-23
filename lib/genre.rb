require "pry"
require_relative "concerns/memorable.rb"
require_relative "concerns/findable.rb"

class Genre
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    super
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self if !song.genre
  end

  def artists
    @songs.map {|s| s.artist}.uniq
  end


end
