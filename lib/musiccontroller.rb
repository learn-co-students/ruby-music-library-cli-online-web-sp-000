class MusicLibraryController

  def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
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
        end
     end
  end

  def list_songs
    i = 1
    sorted_list = Song.all.sort_by{|song| song.name}
    sorted_list.each do |song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i += 1
    end
  end

  def list_artists
    i = 1
    sorted_list = Artist.all.sort_by{|artist| artist.name}
    sorted_list.each do |artist|
      puts "#{i}. #{artist.name}"
      i += 1
    end
  end

  def list_genres
    i = 1
    sorted_list = Genre.all.sort_by{|genre| genre.name}
    sorted_list.each do |genre|
      puts "#{i}. #{genre.name}"
      i += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp.to_s
    artist = Artist.find_by_name(input)
      if artist != nil
        i = 1
        sorted_list = artist.songs.sort_by{|song| song.name}
        sorted_list.each do |song|
        puts "#{i}. #{song.name} - #{song.genre.name}"
        i += 1
        end
      else
      end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp.to_s
    genre = Genre.find_by_name(input)
      if genre != nil
        i = 1
        sorted_list = genre.songs.sort_by{|song| song.name}
        sorted_list.each do |song|
        puts "#{i}. #{song.artist.name} - #{song.name}"
        i += 1
        end
      else
      end
  end

def play_song
  puts "Which song number would you like to play?"
  input = gets.chomp.to_i
  sorted_list = Song.all.sort_by{|song| song.name}
    if input > 0 && input <= sorted_list.length
        song = sorted_list[input-1]
        puts "Playing #{song.name} by #{song.artist.name}"
    else
    end
end

end
