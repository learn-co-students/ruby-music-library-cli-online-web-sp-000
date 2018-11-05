require 'pry'
class Song
    extend Concerns::Findable
    extend Concerns::Findable::ClassMethods
    
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
        song = Song.new(mysong)
        song.save
        song
    end

    def self.new_from_filename(filename)
        artistname = filename.split(" - ")[0]
        songname = filename.split(" - ")[1]
        genrename = filename.split(" - ")[2].split(".")[0]

        myartist = Artist.find_or_create_by_name(artistname)
        mygenre = Genre.find_or_create_by_name(genrename)

        song=self.new(songname,myartist,mygenre)
    end

    def self.create_from_filename(filename)
        song= self.new_from_filename(filename)
        song.save
        song
    end
end
