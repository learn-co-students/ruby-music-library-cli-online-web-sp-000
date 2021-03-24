class Genre
    
    attr_accessor :name, :songs

    extend Concerns::Findable 

    
    @@all = []

    def initialize(name)
        @name = name
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def self.destroy_all
        self.all.clear
    end

    def count
        self.all.size
    end

    def songs
        Song.all.select {|s| s.genre == self}
    end

    def artists
        songs.map{|a| a.artist}.uniq
    end


end