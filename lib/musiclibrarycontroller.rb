class MusicLibraryController

  def initialize(path= "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    user_input = ""
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
    if user_input == "list songs"
      self.list_songs
    elsif user_input == "list artists"
      self.list_artists
    elsif user_input == "list genres"
      self.list_genres
    elsif user_input == "list artist"
      self.list_songs_by_artist
    elsif user_input == "list genre"
      self.list_songs_by_genre
    elsif user_input == "play song"
      self.play_song
    end
  end
end

  def list_songs
    Song.sort_songs
  end

  def list_artists
    Artist.sort_songs
  end

  def list_genres
    Genre.sort_songs
  end

  #prompts the user to enter an artist
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    if artist = Artist.find_by_name(user_input)
      sorted_array = artist.songs.sort{|a,b| a.name <=> b.name}
      sorted_array.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
        end
      end
   end

   #prompts the user to enter a genre
   def list_songs_by_genre
     puts "Please enter the name of a genre:"
     user_input = gets.strip
     if genre = Genre.find_by_name(user_input)
       genre_sorted_array = genre.songs.sort{|a,b| a.name <=> b.name}
       genre_sorted_array.each_with_index do |song, index|
         puts "#{index+1}. #{song.artist.name} - #{song.name}"
         end
       end
    end

    #prompts the user to choose a song from the alphabetized list output by #list_songs
    def play_song
      puts "Which song number would you like to play?"
      user_input = gets.strip
      alphabetized_songs = Song.all.uniq.sort_by{|s|s.name}
      alphabetized_songs.each_with_index do |song, index|
        if user_input.to_i-1 == index
          puts "Playing #{song.name} by #{song.artist.name}"
        end
      end
    end
end
