class Artist

require "pry"
    attr_accessor :name, :songs, :song

    
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
       @@all << self
        
    end

    def self.find_or_create_by_name(name)

       find =  @@all.find{|artist| artist.name == name}
        if find == nil   
         self.new(name) 
        else
            find          
end
end

def save
    @@all << self
end

def self.create(name)
    Song.new(name)
    @@all << self
    self
#if !self.all.include?(name)
end


def self.all
        @@all
    end

def add_song(song)
    song.artist = self if song.artist == nil
    self.songs << song if self.songs.include?(song) == false
end

def self.destroy_all
    @@all.clear
end

def print_songs

    songs.each { |song| puts song.name }
    
end
end


