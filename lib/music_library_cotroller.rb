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
      input = gets
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
      while 
      end
    end
  end
  
  
end



#learn spec/011_music_library_cli_methods_spec.rb