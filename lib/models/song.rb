class Song 
    extend Persistable::ClassMethods
    extend Concerns::Findable 
    include Persistable::InstanceMethods 

    attr_accessor :name, :artist
    attr_reader :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name 
        # @genre = genre 
        self.artist = artist if artist
        self.genre = genre if genre 
    end     

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
      end

    def artist=(artist)
        @artist = artist
        artist.add_song(self) 
    end     

    def self.all 
        @@all 
    end 

    def self.create(name) 
        new_song = Song.new(name)
        new_song.save 
        new_song
      
    end     

    def self.find_by_name(name) 
        self.all.detect {|song| song.name == name} 
        # binding.pry 
    end     

    def self.find_or_create_by_name(name) 
        find_by_name(name) || create(name)    
    end   
    
    def self.new_from_filename(filename)
        artist, song, genre = filename.split(' - ')
        fixed_name = genre.gsub('.mp3', '')
        artist = Artist.find_or_create_by_name(artist)
        genre = Genre.find_or_create_by_name(fixed_name) 
        new(song, artist, genre)
    end     

    def self.create_from_filename(filename) 
        new_song = self.new_from_filename(filename)
        @@all << new_song
    end     
end     