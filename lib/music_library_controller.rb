class MusicLibraryController
    attr_accessor 
    def initialize(path = "./db/mp3s")
        MusicImporter.new(path).import
    end

    def call
        commands = ["list songs", "list artists", "list genres", "list artist", "list genre",
        "exit"]
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        input = ""
        until input == "exit"
          puts "What would you like to do?"
          input = gets.chomp
          if input == "list songs"
            list_songs
          elsif input == "list artists"
            list_artists
          elsif input == "list genres"
            list_genres
          elsif input == "list artist"
            list_songs_by_artist
          elsif input == "list genre"
            list_songs_by_genre
          elsif input == "play song"
            play_song
          end
        end
    end

    def list_songs
       list = Song.all.sort_by {|song| song.name}
       list.each_with_index do |song, i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
       end
    end

    def list_artists
        list = Artist.all.sort_by {|artist| artist.name}
        list.each_with_index do |artist, i|
            puts "#{i + 1}. #{artist.name}"
        end
    end

    def list_genres
        list = Genre.all.sort_by {|genre| genre.name}
        list.each_with_index do |genre, i|
            puts "#{i + 1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist = gets.chomp
        if Artist.find_by_name(artist)
          songs = Artist.find_by_name(artist).songs.sort_by {|song| song.name}
          songs.each_with_index do |song, i|
              puts "#{i + 1}. #{song.name} - #{song.genre.name}"
          end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre = gets.chomp
        if Genre.find_by_name(genre)
            songs = Genre.find_by_name(genre).songs.sort_by {|song| song.name}
            songs.each_with_index do |song, i|
                puts "#{i + 1}. #{song.artist.name} - #{song.name}"
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        input = gets.chomp.to_i
        if input > 0 && input <= Song.all.count        
          list = Song.all.sort_by {|song| song.name}
          song = list[input - 1]
          puts "Playing #{song.name} by #{song.artist.name}"
        end
    end
end