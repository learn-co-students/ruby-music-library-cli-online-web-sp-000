require 'pry'

class Genre

  attr_accessor :name

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
    new_object = Genre.new(name)
    new_object.save
    new_object

  #   names = []
  #   self.all.each do |object|
  #     names << object.name
  #   end
  #
  #   if !names.include?(name)
  #     new_object = self.new(name)
  #     new_object.save
  #     new_object
  #   end
  end

  def songs
    @songs
  end


  def artists
    artist_list = []
    @songs.each do |song|
      if !artist_list.include?(song.artist)
        artist_list << song.artist
      end
    end
    artist_list
  end

end
