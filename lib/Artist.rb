class Artist 
    extend Concerns::Findable
    extend Memorable::ClassMethods
    include Memorable::InstanceMethods
    
    attr_accessor :name #, :songs
    @@all = []

    def initialize(name)
        @name = name 
        # @songs = [] - Don't need this cuz defined songs instance method below.
        save 
    end 

    def self.all 
        @@all 
    end 

    # included Memorable::InstanceMethods for this instance meth
    # def save 
    #     @@all << self 
    # end 

     # extended Memorable::ClassMethods for these two class meths commented out below
    # def self.create(name)
    #     self.new(name)
    # end 

    # def self.destroy_all
    #     self.all.clear
    # end 

    def songs
        Song.all.select {|song| song.artist == self}
    end 

    def add_song(song)
        # @songs << song unless songs.include?(song)
        song.artist = self unless song.artist
    end 

    def genres 
        songs.collect {|song| song.genre}.uniq
    end 
end