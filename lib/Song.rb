require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  def artist=(artist)
    @artist = artist
    if @artist != nil
      @artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if @genre != nil
      if !@genre.songs.include?(self)
        @genre.songs << self
      end
    end

  end

  def self.all
    @@all
  end

  def save
    @@all << self
    # names = []
    # self.class.all.each do |object|
    #   names << object.name
    # end
    #
    # if !names.include?(self.name)
    #   self.class.all << self
    # end
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
    # names = []
    # self.all.each do |object|
    #   names << object.name
    # end
    #
    # if !names.include?(name)
    #   new_object = self.new(name)
    #   new_object.save
    #   new_object
    # end

  end

  def self.destroy_all
    @@all.clear
  end

  # def self.find_by_name(name)
  #   Song.all.detect {|song| song.name == name}
  # end

  # def self.find_or_create_by_name(name)
  #   if Song.find_by_name(name) == nil
  #     new_song = self.create(name)
  #   else
  #     Song.find_by_name(name)
  #   end
  # end

end
