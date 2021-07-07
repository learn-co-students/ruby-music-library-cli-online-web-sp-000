require 'pry'
require_relative '../lib/concerns/memorable'
require_relative '../lib/concerns/findable'
require_relative '../lib/concerns/paramable'
require_relative '../config/environment'

class Artist
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Concerns::Findable
  extend Findable::ClassMethods
  include Findable::InstanceMethods
  include Paramable::InstanceMethods

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
    @songs = []
  end

  def self.create(name)
    # newartist = self.find_by_name(name)
    # if newartist == nil
      newartist = Artist.new(name)
      newartist.save
    # end
    newartist
  end

  def self.all
    @@all
  end

  def add_song(song)
    if song_exists?(@songs, song) == nil
      @songs << song
    end
    if song.artist == ""
      song.artist = self
    end
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end
end
