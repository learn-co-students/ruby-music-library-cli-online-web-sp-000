class Genre 
  extend Concerns::Findable
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    save
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end
  
  def self.all #class reader
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end
  
  def add_song(song)
    if song.genre == nil
      song.genre = self
    else
      nil
    end
    if @songs.include?(song)
      nil
    else
      @songs << song
    end
    song
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