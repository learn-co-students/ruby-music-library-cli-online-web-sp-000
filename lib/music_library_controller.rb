class MusicLibraryController
  
  def initialize(path="./db/mp3s")
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end

  def call
    loop do
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
        when "list songs" then list_songs
        when "list artists" then list_artists
        when "list genres" then list_genres
        when "list artist" then list_songs_by_artist
        when "list genre" then list_songs_by_genre
        when "play song" then play_song
        end
      break if input == "exit"
      end
  end

  def list_songs
    alphabetized_songs = Song.all.sort do |a, b|
      a.name <=> b.name
    end
    alphabetized_songs.each.with_index(1) do |song, index|
        puts "#{index}. #{"#{song.artist.name} - #{song.name} - #{song.genre.name}"}"
      end
  end

  def list_artists
    alphabetized_artist_names = Artist.all.map {|artist| artist.name }.sort
    alphabetized_artist_names.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist}"
    end
  end

  def list_genres
    alphabetized_genre_names = Genre.all.map {|genre| genre.name }.sort
    alphabetized_genre_names.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    if Artist.find_by_name(artist_name)
        artist = Artist.find_by_name(artist_name)
        alphabetized_songs = artist.songs.sort do |a, b|
          a.name <=> b.name
        end
        alphabetized_songs.each.with_index(1) do |song, index|
          puts "#{index}. #{song.name} - #{song.genre.name}"
        end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    if Genre.find_by_name(genre_name)
        genre = Genre.find_by_name(genre_name)
        alphabetized_songs = genre.songs.sort do |a, b|
          a.name <=> b.name
        end
        alphabetized_songs.each.with_index(1) do |song, index|
          puts "#{index}. #{song.artist.name} - #{song.name}"
        end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    if song_number > 0 && song_number <= Song.all.length
        alphabetized_songs = Song.all.sort do |a, b|
            a.name <=> b.name
          end
        song_to_play = alphabetized_songs[song_number - 1]
        puts "Playing #{song_to_play.name} by #{song_to_play.artist.name}"
    end
   end

end