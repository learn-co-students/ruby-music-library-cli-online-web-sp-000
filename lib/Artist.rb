require 'pry'

class Artist
    extend Concerns::Findable
    extend Memorable::ClassMethods
    include Memorable::InstanceMethods
    
    attr_accessor :name, :songs
    
    @@all = []
  
    def initialize(name)
      @name = name
      #@songs = []
      save
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
        #binding.pry
      end
  
    def add_song(song)
        song.artist = self unless song.artist == self
        #@songs << song unless @song.include?(song)
    end
  
    def genres
      songs.collect{|song| song.genre}.uniq
    end
  
  end