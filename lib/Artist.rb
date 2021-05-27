class Artist 
    attr_accessor :name, :songs 
    @@all = []

    extend Concerns::Findable

    def initialize(name)
        @name = name 
        @songs = []
        save 
    end 

    def self.all 
        @@all 
    end 

    def save 
        @@all << self 
    end 

    def self.create(name)
        artist = self.new(name)
        artist
    end 

    def songs
        Song.all.select {|song| song.artist == self}
    end 

    def add_song(song)
        @songs << song unless songs.include?(song)
        song.artist = self unless song.artist
    end 

    def genres 
        songs.collect {|song| song.genre}.uniq
    end 

    def self.destroy_all
        self.all.clear
    end 
end