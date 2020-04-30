class MusicLibraryController
  def initialize(path="./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end
  
  def call
    puts "Welcome to your music library!"
    input = ""
    while input != "exit"
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
    song_list = Song.all.collect {|s| s.name}.sort
    i = 0
    while i < song_list.length
      Song.all.each do |s|
        if s.name == song_list[i]
          i += 1
          puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
        end
      end
    end
  end

  def list_artists
    i = 0
    artist_list = Artist.all.collect {|a| a.name}.sort
    artist_list.each do |a|
      i += 1
      puts "#{i}. #{a}"
    end
  end
  
  def list_genres
    i = 0
    genre_list = Genre.all.collect {|a| a.name}.sort
    genre_list.each do |a|
      i += 1
      puts "#{i}. #{a}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    if Artist.find_by_name(input) != nil
      song_by_artist = Artist.find_by_name(input).songs.collect {|s| "#{s.name} - #{s.genre.name}"}.sort
      i = 0
      while i < song_by_artist.length
        puts "#{i+1}. #{song_by_artist[i]}"
        i += 1
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    if Genre.find_by_name(input) != nil

      song_by_genre = Genre.find_by_name(input).songs.collect {|s| s.name}.sort
      i = 0
      while i < song_by_genre.length
        Genre.find_by_name(input).songs.each do |s|
          if s.name == song_by_genre[i]
            puts "#{i+1}. #{s.artist.name} - #{s.name}"
          i += 1
          end
        end
      end
    end
  end
  
  def play_song 
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort {|a, b| a.name <=> b.name }[input - 1]
    end
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
  
end



#learn spec/011_music_library_cli_methods_spec.rb