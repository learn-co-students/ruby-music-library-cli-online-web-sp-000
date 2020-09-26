require "pry"

class Artist

    extend Concerns::Findable



    attr_accessor :name, :songs

    
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
       @@all << self
        
    end


def genres
    self.songs.collect {|song|song.genre}.uniq
        #binding.pry
end



def save
    @@all << self
end

def self.create(name)
   Artist.new(name)
   
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


