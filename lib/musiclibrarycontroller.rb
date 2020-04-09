class MusicLibraryController

  def initialize(path='./db/mp3s')
    @new_music_library = MusicImporter.new(path)
    @new_music_library.import
  end

  def list_songs
    @alphabetised_songs = []
    alphabetised_song_list = Song.all.sort! { |a, b| a.name <=> b.name }
    alphabetised_song_list.each_with_index do |song, index|
      @alphabetised_songs << song
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    @alphabetised_songs
  end

  def list_artists
    artists = Artist.all.collect { |artist| artist.name }
    artists.sort!
    artists.uniq.each_with_index { |artist, index| puts "#{index + 1}. #{artist}" }
  end

  def list_genres
    genres = Genre.all.collect { |genre| genre.name }
    genres.sort!
    genres.uniq.each_with_index { |genre, index| puts "#{index + 1}. #{genre}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    #need to find all the songs by that artist
    artist_instance = Artist.all.find { |artist| artist.name == input }
    if artist_instance
      artist_instance.songs.sort! { |a, b| a.name<=>b.name }
      artist_instance.songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    #need to find all the songs by that artist
    genre_instance = Genre.all.find { |genre| genre.name == input }
    if genre_instance
      genre_instance.songs.sort! { |a, b| a.name<=>b.name }
      genre_instance.songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    alphabetised_song_list = Song.all.sort! { |a, b| a.name <=> b.name }
    if alphabetised_song_list[input-1] && input.between?(1, Song.all.length)
      song = alphabetised_song_list[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
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
    input = gets.strip
    if input == "exit"
    elsif input == "list songs"
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
    else
      call
    end
  end

end
