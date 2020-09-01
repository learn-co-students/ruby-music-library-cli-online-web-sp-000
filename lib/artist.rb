class Artist

  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    self.new(name).save
  end

  def self.destroy_all
    @@all.clear
  end
  
  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song unless @songs.include?(song)
    song
  end
  
  # def genres
  #   @new_array = []
  #   @songs.each do |song|
  #     if @new_array.include?(song.genre)
  #       nil
  #     else
  #       @new_array << song.genre
  #     end
  #   end
  #   @new_array
  # end
  
end