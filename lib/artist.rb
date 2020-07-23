class Artist
  extend Memorable::ClassMethods, Concerns::Findable
  include Memorable::InstanceMethods

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.artist = self if song.artist == nil
    #song.artist = self.class.find_or_create_by_name(@name)
    #add_genre(song.genre) if song.genre != nil
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end
  #def add_genre(genre)
  #  @genres << genre if !@genres.include?(genre)
  #end
  #def self.destroy_all
  #  @@all.clear
  #end

  #def save
  #  @@all << self
  #end

  #def self.create(name)
  #  Artist.new(name)
  #end
end
