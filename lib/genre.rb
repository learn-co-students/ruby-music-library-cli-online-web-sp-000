
class Genre
    extend Concerns::Findable
    
    attr_accessor :name
    
    @@all = []
    
    def initialize(name)
        @name = name
        @songs = []
    end
    
    def artists
        @songs.collect {|x| x.artist}.uniq
    end
    
    def add_song(song)
        song.genre = self unless song.genre 
        @songs << song unless songs.include?(song)
    end
    
    def save
        @@all << self
    end
    
    def self.all
        @@all
    end
    
    def self.destroy_all
        @@all.clear
    end
    
    def songs
        @songs
    end
    
    def self.create(name)
        genre = self.new(name)
        genre.save
        genre
    end
    
end


# class Genre
#     extend Concerns::Findable

#     attr_accessor :name, :songs

#     @@all = []

#     def initialize(name)
#         @name = name
#         @songs = []
#     end

#     def self.all
#         @@all
#     end

#     def self.destroy_all
#         @@all.clear
#     end

#     def save
#         @@all << self
#     end

#     def self.create(genre_name)
#         genre = self.new(genre_name)
#         genre.save
#         genre
#     end

#     def add_song(song)
#         song.genre = self unless song.genre
#         @songs << song unless songs.include?(song)
#     end

#     def artists
#         artist_array = songs.collect do |song|
#             song.artist
#         end
#         artist_array.uniq
#     end

# end