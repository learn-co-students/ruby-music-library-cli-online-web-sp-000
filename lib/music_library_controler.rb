require 'pry'
class MusicLibraryController

  def initialize(path="./db/mp3s")
    new_importer = MusicImporter.new(path)
    new_importer.import
  end

  def call
    input = nil

    while input != 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "What would you like to do?"
      puts "To quit, type 'exit'."
      input = gets.strip
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end

    end
  end

    def list_songs
      song_names = Song.all.collect {|song| "#{song.artist.name} - #{song.name} - #{song.genre.name}"}.sort_by {|song| song.split(" - ")[1]}.uniq
      # binding.pry
      # song_names = sorted_songs.collect {|song| "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      i = 1
      song_names.each do |song|
        puts "#{i}. #{song}"
        i += 1
      end
    end

    def list_artists
      artist_names = Artist.all.collect {|artist| "#{artist.name}"}.sort.uniq
      # binding.pry
      # song_names = sorted_songs.collect {|song| "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      i = 1
      artist_names.each do |artist|
        puts "#{i}. #{artist}"
        i += 1
      end
    end

    def list_genres
      genre_names = Genre.all.collect {|genre| "#{genre.name}"}.sort.uniq
      # binding.pry
      # song_names = sorted_songs.collect {|song| "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      i = 1
      genre_names.each do |genre|
        puts "#{i}. #{genre}"
        i += 1
      end
    end
    #
    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist_input = gets.chomp
      artist = Artist.find_by_name(artist_input)
      if artist != nil
        song_names = artist.songs.collect {|song| "#{song.name} - #{song.genre.name}"}.sort_by {|song| song.split(" - ")[0]}.uniq
        i = 1
        song_names.each do |song|
          puts "#{i}. #{song}"
          i += 1
        end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre_input = gets.chomp
      genre = Genre.find_by_name(genre_input)
      if genre != nil
        song_names = genre.songs.collect {|song| "#{song.artist.name} - #{song.name}"}.sort_by {|song| song.split(" - ")[1]}.uniq
        i = 1
        song_names.each do |song|
          puts "#{i}. #{song}"
          i += 1
        end
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      # list_songs
      choice = gets.chomp
      # # binding.pry
      if choice.to_i > 0 && choice.to_i <= Song.all.length
        song_index = choice.to_i - 1
        sorted_songs = Song.all.sort_by {|song| song.name}.uniq
        chosen_song = sorted_songs[song_index]
        if chosen_song
          puts "Playing #{chosen_song.name} by #{chosen_song.artist.name}"
        end
      end

    end



end
