require 'pry'

class MusicLibraryController

  def initialize(path='./db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
    @sorted_songs =
      Song.all.sort do |a, b|
        if a.name == b.name
          0
        elsif a.name < b.name
          -1
        elsif a.name > b.name
          1
        end
      end
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

    command = gets
    while command != "exit"
      if command == "list songs"
        self.list_songs
      elsif command == "list artists"
        self.list_artists
      elsif command == "list genres"
        self.list_genres
      elsif command == "list artist"
        self.list_songs_by_artist
      elsif command == "list genre"
        self.list_songs_by_genre
      elsif command == "play song"
        self.play_song
      end
      command = gets
    end
  end

  def list_songs
    sorted_songs =
      Song.all.sort do |a, b|
        if a.name == b.name
          0
        elsif a.name < b.name
          -1
        elsif a.name > b.name
          1
        end
      end
    count = 1
    sorted_songs.each do |song|
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      count += 1
    end
  end

  def list_artists
    sorted_artists =
      Artist.all.sort do |a, b|
        if a.name == b.name
          0
        elsif a.name < b.name
          -1
        elsif a.name > b.name
          1
        end
      end
    count = 1
    sorted_artists.each do |artist|
      puts "#{count}. #{artist.name}"
      count += 1
    end
  end

  def list_genres
    sorted_genres =
      Genre.all.sort do |a, b|
        if a.name == b.name
          0
        elsif a.name < b.name
          -1
        elsif a.name > b.name
          1
        end
      end
    count = 1
    sorted_genres.each do |genre|
      puts "#{count}. #{genre.name}"
      count += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets
    artist = Artist.find_by_name(artist_name)
    if artist
      sorted_songs =
        artist.songs.sort do |a, b|
          if a.name == b.name
            0
          elsif a.name < b.name
            -1
          elsif a.name > b.name
            1
          end
        end
      count = 1
      sorted_songs.each do |song|
        puts "#{count}. #{song.name} - #{song.genre.name}"
        count += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets
    genre = Genre.find_by_name(genre_name)

    if genre
      sorted_songs =
      genre.songs.sort do |a, b|
        if a.name == b.name
          0
        elsif a.name < b.name
          -1
        elsif a.name > b.name
          1
        end
      end
      count = 1
      sorted_songs.each do |song|
        puts "#{count}. #{song.artist.name} - #{song.name}"
        count += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets
    user_input_int = user_input.to_i
    if user_input_int >= 1 && user_input_int <= @sorted_songs.length
      song = @sorted_songs[user_input.to_i - 1]
      if song
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end

end
