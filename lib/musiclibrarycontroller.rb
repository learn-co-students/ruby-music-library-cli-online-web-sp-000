require "pry"
class MusicLibraryController
    attr_reader :path

    def initialize(path = "./db/mp3s")
        @path = path
        musicImporter = MusicImporter.new(path)
        musicImporter.import
    end

    def call
        input = ""
        while input != "exit"
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"
            input = gets.strip()

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
        Song.all.sort_by{|song| song.name}.each.with_index(1) { |song, index|
            puts "#{index.to_s}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        }
    end

    def list_artists
        Artist.all.sort_by{|artist| artist.name}.each.with_index(1) { |artist, index|
            puts "#{index.to_s}. #{artist.name}"
        }
    end

    def list_genres
        Genre.all.sort_by{|genre| genre.name}.each.with_index(1) { |genre, index|
            puts "#{index.to_s}. #{genre.name}"
        }
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        
        input = ""
        while input == ""
            input = gets.strip
        end
        
        Song.all.find_all {|song| song.artist.name == input}.sort_by{|song| song.name}.each.with_index(1) { |song, index|
            puts "#{index.to_s}. #{song.name} - #{song.genre.name}"
        }
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        
        input = ""
        while input == ""
            input = gets.strip
        end
        
        Song.all.find_all {|song| song.genre.name == input}.sort_by{|song| song.name}.each.with_index(1) { |song, index|
            puts "#{index.to_s}. #{song.artist.name} - #{song.name}"
        }
    end

    def play_song
        puts "Which song number would you like to play?"
        
        input = ""
        while input == ""
            input = gets.strip
        end

        song_index = input.to_i - 1
        if song_index > 0 && song_index <= Song.all.length
            song = Song.all.sort_by{|song| song.name}[input.to_i - 1]
            puts "Playing #{song.name} by #{song.artist.name}" unless song == nil
        end
    end


end
