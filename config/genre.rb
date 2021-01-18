class Genre
  attr_accessor :name, :artist
  
  extend Concerns::Findable
  
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
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
  
  def add_song(song)
    @songs << song
  end
  
  def self.destroy_all
    @@all.clear
  end 
  
  def self.create(name)
    gg = Genre.new(name)
  end
  
end