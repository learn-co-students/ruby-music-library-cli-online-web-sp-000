

class MusicLibraryController
    def initialize(path = './db/mp3s')
        @music_importer = MusicImporter.new(path)
        @music_importer.import
    end
    def call
        input = ""
        until input == "exit" do 
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"
            input = gets.strip
            case input
            when "list songs"
                self.list_songs
            when "list artists"
                self.list_artists
            when "list genres"
                self.list_genres
            when "list artist"
                self.list_songs_by_artist
            when "list genre"
                self.list_songs_by_genre
            when "play song"
                self.play_song
            end
            
        end
    end
    def list_songs
        
        #binding.pry
        @song_list = @music_importer.files.map {|file| file.split(" - ")}.sort {|a, b| a[1] <=> b[1]}.map {|file| file.join(" - ").split(".mp3")[0]}
        
        
        @song_list.each_with_index {|file, index| 
        puts "#{index + 1}. " + file
        }
        
    end
    def list_artists
        
        #binding.pry
        @new = []
        Artist.all.each {|artist| @new << artist.name}
        @new = @new.sort.uniq
        #binding.pry
        @new.each_with_index {|file, index| 
        puts "#{index + 1}. " + file
        }
        
    end
    def list_genres
        @new = []
        Genre.all.each {|genre| @new << genre.name}
        @new = @new.sort
        @new.each_with_index {|file, index| 
        puts "#{index + 1}. " + file
        }
    end
    def list_songs_by_artist
        
        
        puts "Please enter the name of an artist:"
        @input = gets.strip
        if Artist.find_by_name(@input)
            artist = Artist.find_by_name(@input)
            #binding.pry
            @newArray = []
            @artist_list = Song.all.select {|song| song.artist == artist}.each {|song| @newArray.push("#{song.name} - #{song.genre.name}")}

            @newArray = @newArray.sort            
            @newArray.each_with_index {|song, index| puts "#{index + 1}. #{song}"}
            
        else
            #artist not found
        end
        
    end
    def list_songs_by_genre
        puts "Please enter the name of a genre:" 
        @input = gets.strip
        if Genre.find_by_name(@input)
            genre = Genre.find_by_name(@input)
            #binding.pry
            @newArray = []
            @song_list_genre = Song.all.select {|song| song.genre == genre}.each {|song| @newArray.push("#{song.artist.name} - #{song.name}")}

            @newArray = @newArray.each {|song| song.split(" - ")}.sort {|a, b| a[1] <=> b[1]}
            #binding.pry
            @newArray.each_with_index {|song, index| puts "#{index + 1}. #{song}"}
            
        else
            #artist not found
        end
    end
    def play_song
        
        puts "Which song number would you like to play?"
        
        @input = gets.strip.to_i

        #binding.pry
        #puts "Playing #{@song_list[@input + 1]} by #{song_list[@input + 1]}"
    end

end

