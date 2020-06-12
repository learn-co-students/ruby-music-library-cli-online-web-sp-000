class MusicLibraryController

    attr_accessor :path

    def initialize(path = "./db/mp3s")
        # binding.pry
        @path = path
        music_importer = MusicImporter.new(path)
        music_importer.import
    end

    def call
        input = ""
        while input != 'exit'
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
        # while input != 'exit'
            case input
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
        sorted_songs = Song.all.sort {|a,b| a.name <=> b.name}
        sorted_songs.each_with_index do |item, index|
            puts "#{index + 1}. #{item.artist.name} - #{item.name} - #{item.genre.name}"
        end
    end

    def list_artists
        sorted_artists = Artist.all.sort {|a,b| a.name <=> b.name}
        sorted_artists.each_with_index do |item, index|
            puts "#{index + 1}. #{item.name}"
        end
    end

    def list_genres
        sorted_genres = Genre.all.sort {|a,b| a.name <=> b.name}
        sorted_genres.each_with_index do |item, index|
            puts "#{index + 1}. #{item.name}"
        end
    end

    # def list_songs_by_artist
    #     puts "Please enter the name of an artist:"
    #     input = gets.strip
    #     #binding.pry
    #     found_artist = Artist.find_by_name(input)
    #     artist_songs_sorted = found_artist.songs.sort {|a,b| a.name <=> b.name}
    #     artist_songs_sorted.each_with_index do |song, index|
    #         puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    #     end
    # end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip
    
        if artist = Artist.find_by_name(input)
            artist.songs.sort {|a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
                puts "#{i}. #{s.name} - #{s.genre.name}"
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip

        if genre = Genre.find_by_name(input)
            genre.songs.sort {|a, b| a.name <=> b.name}.each.with_index(1) do |s, i|
                puts "#{i}. #{s.artist.name} - #{s.name}"
            end
        end
        # binding.pry
    end

    def play_song
        # list_songs
        puts "Which song number would you like to play?"
        input = gets.strip
        # binding.pry
        input_to_i = input.to_i
        if input_to_i >=1 && input_to_i <= Song.all.sort {|a,b| a.name <=> b.name}.length
            sorted_songs = Song.all.sort {|a,b| a.name <=> b.name}
            desired_song = sorted_songs[input_to_i - 1]
            puts "Playing #{desired_song.name} by #{desired_song.artist.name}"
        end
    end

end
