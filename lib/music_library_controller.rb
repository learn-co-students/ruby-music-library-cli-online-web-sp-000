class MusicLibraryController
  def initialize(path = "./db/mp3s")
    @importer = MusicImporter.new(path)
    @importer.import
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
    
    selection(gets)
  end

  def selection(choice)
    case choice
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
    when "exit"
      return 0
    else
      call
    end
  end

  def list_songs
    Song.all.sort_by{|i| i.name}.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by{|i| i.name}.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end
  
  def list_genres
    Genre.all.sort_by{|i| i.name}.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets
    artist = Artist.find_by_name(artist)

    if !!artist
      artist.songs.sort_by{|i| i.name}.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end     
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets
    genre = Genre.find_by_name(genre)

    if !!genre
      genre.songs.sort_by{|i| i.name}.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end     
    end

  end
  
  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.to_i-1
    song = Song.all.sort_by{|i| i.name}[user_input] if user_input >= 0 && user_input < Song.all.size

    if !!song
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end