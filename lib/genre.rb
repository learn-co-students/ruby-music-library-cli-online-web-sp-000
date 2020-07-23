class Genre
extend Concerns::Findable


attr_accessor :name

@@all = []

  def self.all #class reader
    @@all
  end

  def save
    self.class.all << self
  end

  def initialize(name)
    self.name = name
    @songs = []
    
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(genre)
    genre = self.new(genre) #initialize new song
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    @new_array= []
    @songs.each do |song|
      if @new_array.include? (song.artist)
        nil
      else
        @new_array<< song.artist
      end
    end
      @new_array
  end


end
