class Genre
    attr_accessor :name
    attr_reader :songs

    extend Concerns::Findable

    @@all = []
  
    def initialize(name)
      @name = name
      @songs = []
    end
  
    def save
      @@all << self
    end
  
    def self.create(name)
      new_genre = self.new(name)
      new_genre.save
      new_genre
    end
  
    def self.all
      @@all
    end
  
    def self.destroy_all
      self.all.clear
    end

    def artists
      songs.map {|song| song.artist }.uniq
    end

end