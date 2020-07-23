require "pry"

class MusicLibraryController
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
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
    4.times do user_input = gets.chomp
      if user_input == "list songs"
      list_songs
    elsif user_input == "list artists"
      list_artists
    elsif user_input == "list genres"
      list_genres
    elsif user_input == "list artist"
      list_songs_by_artist
    elsif user_input == "list genre"
      list_songs_by_genre
    elsif user_input == "play song"
      play_song
    end     end
  end

  def list_songs
    sorted_songs = Song.all.sort { |song_1, song_2| song_1.name <=> song_2.name }
    sorted_songs.each_with_index { |s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}" }
  end

  def list_artists
    sorted_artists = Artist.all.sort { |artist_1, artist_2| artist_1.name <=> artist_2.name }
    sorted_artists.each_with_index { |a, i| puts "#{i + 1}. #{a.name}" }
  end

  def list_genres
    sorted_genres = Genre.all.sort { |genre_1, genre_2| genre_1.name <=> genre_2.name }
    sorted_genres.each_with_index { |g, i| puts "#{i + 1}. #{g.name}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    all_artists = Artist.all
    if all_artists.any? { |artist| artist.name == user_input }
      matching_artist = Artist.all.detect { |artist| artist.name == user_input }

      songs = matching_artist.songs
      sorted_songs = songs.sort { |song_1, song_2| song_1.name <=> song_2.name }

      sorted_songs.each_with_index { |s, i| puts "#{i + 1}. #{s.name} - #{s.genre.name}" }
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    all_genres = Genre.all
    if all_genres.any? { |genre| genre.name == user_input }
      matching_genre = Genre.all.detect { |genre| genre.name == user_input }

      songs = matching_genre.songs
      sorted_songs = songs.sort { |song_1, song_2| song_1.name <=> song_2.name }
      sorted_songs.each_with_index { |s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name}" }
    end
  end

  def play_song
    puts "Which song number would you like to play?"

    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort { |a, b| a.name <=> b.name }[input - 1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
end

#     end
#   end

# "1. Thundercat - For Love I Come - dance")
#   expect($stdout).to receive(:puts).with("2. Real Estate - Green Aisles - country")
#   expect($stdout).to receive(:puts).with("3. Real Estate - It's Real - hip-hop")
#   expect($stdout).to receive(:puts).with("4. Action Bronson - Larry Csonka - indie")
#   expect($stdout).to receive(:puts).with("5. Jurassic 5 - What's Golden - hip-hop")

#   def list_songs
#     songs.each do |song| song.gsub(".mp3", "") end
#   end
# end
