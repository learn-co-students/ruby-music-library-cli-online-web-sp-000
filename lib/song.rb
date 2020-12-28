require 'pry'


class Song

attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name 
        self.artist = artist unless artist == nil
        self.genre = genre unless genre == nil
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
        song = self.new(name)
        song.save
        song
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
        # genre.songs << self unless genre.songs.include? (self)
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self) 
    end


    def self.find_by_name(song_name)
        @@all.find {|song| song.name == song_name}
    end

    def self.find_or_create_by_name(name)
       find_by_name(name) || create(name)
        # if find_by_name(name)
        #     find_by_name(name)
        # else
        #     create(name)
        # end
    end

    def self.new_from_filename(filename)
        song_split = filename.split(" - ")
        artist_name = song_split[0]
        genre_name = song_split[2].chomp(".mp3")
        # binding.pry
        song_name = song_split[1]

        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)

        song = Song.new(song_name, artist, genre)

    end



    def self.create_from_filename(filename)
        @@all << self.new_from_filename(filename) 
    end


end







# class Song
#     attr_accessor :name, :artist, :genre#does both the getting and the setting

#     @@all = []

#    def initialize(name, artist=nil, genre=nil)#optional if you add nil
#       @name = name
#     self.artist=(artist) if artist != nil #adds artist if artist isnt nil
#     self.genre=(genre) if genre != nil
#     # if genre != nil
#     #     self.genre = genre
#     # end
#     end

#    def self.all
#     @@all
#    end

#    def self.destroy_all
#     @@all.clear
#    end

#    def save
#     @@all << self
#    end

#    def self.create(name)
#     song = self.new(name) 
#     #since it initializes with a name enter the name when initilizing
#     song.save
#     song
#    end

#    def artist=(artist_name)
#     @artist = artist_name
#     artist_name.add_song(self) #make sure association is created at initialization
#    end

#    def genre=(genre)
#     @genre = genre
#     genre.add_song(self)
#    end

#    def self.find_by_name(name)
#     @@all.detect{|song| song.name == name}
#     #going through the array of all songs and finding the first song that matches
#    end

#    def self.find_or_create_by_name(name)
#     self.find_by_name(name) || self.create(name)
#    end

#    def self.new_from_filename(name)
#     #put pry in
#     name = name.chomp(".mp3")
#     artist, song, genre = name.split(" - ") #destructure to assign variables
#     artist = Artist.find_or_create_by_name(artist)
#     genre = Genre.find_or_create_by_name(genre)
#     song = Song.new(song,artist,genre)
#     # binding.pry
#    end

#    def self.create_from_filename(name)
#     new = self.new_from_filename(name)
#     new.save
#    end

# end

