require "pry"

module Concerns

module Findable

    def find_by_name(name) 
      #binding.pry      
        self.all.detect{|a| a.name == name}
      end
    
    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
      #binding.pry
      end
    end

   def list_songs  
      sorted_songs = Song.all.sort{ |a,b| a.name <=> b.name}
      sorted_songs.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"    
      end
  end  
  end


  require_all 'lib'