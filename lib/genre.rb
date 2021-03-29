class Genre
    extend Concerns::Findable
  
    attr_accessor :name
  
    @@all = []
  
    def initialize(name)
      @name = name
    end
  
    def self.all
      @@all
    end
  
    def self.destroy_all
      all.clear
    end
  
    def save
      self.class.all << self
      self
    end
  
    def self.create(name)
      new(name).save
    end
  
    def songs 
      Song.all.select{ |s| s.genre == self }
    end

    def artists
      songs.collect{ |s| s.artist }.uniq
    end
  end