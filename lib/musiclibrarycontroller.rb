
class MusicLibraryController
    extend Concerns::Sortables
    include Concerns::Sortables
    
    attr_accessor :mp3Path

# initialize the controller to import the files from the music importer.
    def initialize (mp3Path = "./db/mp3s")
        @mp3Path = mp3Path
        MusicImporter.new(mp3Path).import        
    end
    
# output a selection list for the user to choose options.
    def call

        selection = gets.strip
       unless selection == exit

        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        
  # trigger the methods for the individual selections. 
        case selection
            when 'list songs' 
                list_songs 
                
            when 'list artists' 
                list_artists
                
            when 'list genres' 
                list_genres
                
            when 'list artist' 
                list_songs_by_artist
                
            when 'list genre' 
                list_songs_by_genre
                
            when 'play song' 
                play_song
            end
        end
    end
    
    def list_songs 
       sort_with_index
    end
     
    def list_artists
        sort_with_index
    end
        
    def list_genres
       sort_with_index
    end
  
    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_name = gets.strip
    
        if artist = Artist.find_by_name(artist_name)
           list_with_index
        end
    end
    
    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_type = gets.strip
    
        if genre = Genre.find_by_name(genre_type)
            list_with_index
        end
    end

   def play_song
    puts "Which song number would you like to play?"
    
    song_number = gets.strip.to_i
    
    if song_number > 0 && song_number <= Song.all.length
      song_array = Song.all.sort{|a, b| a.name <=> b.name}
      song = song_array[song_number -1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end    
