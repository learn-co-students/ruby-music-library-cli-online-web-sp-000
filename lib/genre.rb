class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

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
  end

  def self.create(name)
    newGenre = Genre.new(name)
    newGenre.save
    newGenre
  end

  def add_song(song)
    if self.songs.find{ |existing_song| existing_song == song }
    puts "song already found in genre"
    #song.genre = self
    else
      @songs << song
    end
  end

  def artists # Returns an Artist's genres
    @genre_artists = []
    @songs.each do |song|
      @genre_artists << song.artist
    end
   @genre_artists.uniq
  end

end
