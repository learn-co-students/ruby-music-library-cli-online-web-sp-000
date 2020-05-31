require "pry"
class MusicLibraryController

    def initialize(path = "./db/mp3s")
        importer = MusicImporter.new(path)
        importer.import
    end

    def call
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        command = nil
        while command != "exit"
            command = gets
        case command
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
        else
            "Not a valid command"
        end
    end
    end

    def list_songs
        sorted = Song.all.sort{|song1, song2| song1.name <=> song2.name}
        sorted.each_with_index { |song, index|
        puts (index+1).to_s + ". " + [song.artist.name, song.name, song.genre.name].join(" - ")
    }
    end
    def list_artists
        artists = []
        Artist.all.each{|artist| artists << artist.name; artists}
        sorted = artists.sort.uniq
        sorted.each_with_index { |artist, index|
            puts (index+1).to_s + ". " + artist
        }
    end

    def list_genres
        genres = []
        Genre.all.each{|genre| genres << genre.name; genres}
        sorted = genres.sort.uniq
        sorted.each_with_index { |genre, index|
            puts (index+1).to_s + ". " + genre
        }
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_name = gets
        artist = Artist.find_or_create_by_name(artist_name)
        sorted = artist.songs.sort{|song1, song2| song1.name <=> song2.name}
        sorted.each_with_index {|song, index| puts (index+1).to_s + ". " + [song.name, song.genre.name].join(" - ")}
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_name = gets
        genre = Genre.find_or_create_by_name(genre_name)
        sorted = genre.songs.sort{|song1, song2| song1.name <=> song2.name}
        sorted.each_with_index {|song, index| puts (index+1).to_s + ". " + [song.artist.name, song.name].join(" - ")}
    end

    def play_song
        puts "Which song number would you like to play?"
        number = 0
        number = gets.to_i
        sorted = Song.all.sort{|song1, song2| song1.name <=> song2.name}
        song = sorted[number - 1]
        
        if song && number > 0
            song_name = song.name
            artist_name = song.artist.name
            puts "Playing #{song_name} by #{artist_name}"
        end
    end
end