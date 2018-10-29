require 'pry'
class Song
    
    @@all = []
    
    attr_accessor :name
    attr_reader :artist, :genre

    def initialize(name,art=nil,genr=nil)
        @name = name
        if art != nil
            self.artist = art
        end
        if genr != nil
            self.genre = genr
        end
    end
    
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end
    
    def genre=(genre)
        @genre = genre
        genre.add_songGen(self)
    end
    
    def save
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.destroy_all
        @@all = []
    end

    def self.create(mysong)
        self.new(mysong).save
        self
    end

    def self.find_by_name(myname)
        @@all.detect do |obj|
            obj.name == myname
            #     binding.pry
        end
    end
end
