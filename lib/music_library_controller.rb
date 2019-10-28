class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end
  
  def call
    user_input = ""
    safety = 0 # prevent infinite loop
    while user_input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      user_input = gets.strip
      # case input
      #   when "list songs"
      #     safety = 0
      #     list_songs
      #   when "list artists"
      #     safety = 0
      #     list_artists
      #   when "list genres"
      #     safety = 0
      #     list_genres
      #   when "list artist"
      #     safety = 0
      #     list_songs_by_artist
      #   when "list genre"
      #     safety = 0
      #     list_songs_by_genre
      #   when "play song"
      #     safety = 0
      #     play_song
      #   end
      # prevent infinite loop
      raise "break Possible infinite loop"  if safety >= 15
      safety += 1
      user_input
    end
  end
  
  def list_songs
    song_list = Song.all.collect {|song| song }.uniq.sort
    song_list.each_with_index do
      |song, index| 
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
    end
  end

  def list_artists
    artist_name = Artist.all.collect {|artist| artist.name }.uniq.sort
    artist_name.each_with_index { |artist, index| puts "#{index+1}. #{artist}" }
  end
  
  def list_genres
    genre_name_name = Genre.all.collect {|genre| genre.name }.uniq.sort
    genre_name_name.each_with_index { |genre, index| puts "#{index+1}. #{genre}" }
  end

  def list_songs_by_artist
  end
  
  def list_songs_by_genre
  end

  def play_song
  end
end
