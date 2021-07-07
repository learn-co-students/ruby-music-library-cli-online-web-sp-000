require 'pry'
require_relative '../lib/concerns/memorable'
require_relative '../lib/concerns/findable'
require_relative '../lib/concerns/paramable'
require_relative '../config/environment'

class Genre
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable::ClassMethods
  include Findable::InstanceMethods
  include Paramable::InstanceMethods
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :genres

  @@all = []

  def initialize(name)
    self.genre=(name)
    self.class.all << self
    @songs = []
  end

  def genre=(name)
    @name = name
    # if genre != ""
    #   genre.add_song(self)
    # end
  end

  def self.create(genre)
    newgenre = Genre.new(genre)
    newgenre.save
    newgenre
  end

  def add_song(song)
    if song_exists?(@songs, song) == nil
      @songs << song
    end
    if song.artist == ""
      song.artist = self
    end
  end

  def artists
    @songs.collect{|song| song.artist}.uniq
  end


  def songs
    @songs
  end

  def self.all
    @@all
  end
end
