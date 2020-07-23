class MusicLibraryController
  @@all = []
  attr_accessor = :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    newMusicImporter_oi = MusicImporter.new(path)
    newMusicImporter_oi.import
    save
  end
    
  def self.all
    @@all 
  end
  
  def save
    @@all << self
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
    user_input = gets.chomp
    list_songs if user_input == 'list songs'
    list_artists if user_input == 'list artists'
    list_genres if user_input == 'list genres'
    list_songs_by_artist if user_input == 'list artist'
    list_songs_by_genre if user_input == 'list genre'
    play_song if user_input == 'play song'
    call unless user_input == "exit"
  end
  
  def list_songs
    sortedSong_oi_arr = Song.all.sort {|i, j| i.name <=> j.name }
    sortedSong_oi_arr.each {|i| puts "#{(sortedSong_oi_arr.index(i).to_i) + 1}. #{i.artist.name} - #{i.name} - #{i.genre.name}" }
  end
  
  def list_artists
    sortedArtists_oi_arr = Artist.all.sort {|i, j| i.name <=> j.name }
    sortedArtists_oi_arr.each {|i| puts "#{(sortedArtists_oi_arr.index(i).to_i) + 1}. #{i.name}" }
  end
  
  def list_genres
    sortedGenres_oi_arr = Genre.all.sort {|i, j| i.name <=> j.name }
    sortedGenres_oi_arr.each {|i| puts "#{(sortedGenres_oi_arr.index(i).to_i) + 1}. #{i.name}" }
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    artistSong_oi_arr = Song.all.select {|i| i.artist.name == user_input}
    sortedSongs_oi = artistSong_oi_arr.sort {|i, j| i.name <=> j.name}
    sortedSongs_oi.each do |i|
      puts "#{sortedSongs_oi.index(i).to_i + 1}. #{i.name} - #{i.genre.name}"
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    artistSong_oi_arr = Song.all.select {|i| i.genre.name == user_input}
    sortedSongs_oi = artistSong_oi_arr.sort {|i, j| i.name <=> j.name}
    sortedSongs_oi.each do |i|
      puts "#{sortedSongs_oi.index(i).to_i + 1}. #{i.artist.name} - #{i.name}"
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp.to_i
    sortedSong_oi_arr = Song.all.sort {|i, j| i.name <=> j.name}
    puts "Playing #{sortedSong_oi_arr[user_input - 1].name} by #{sortedSong_oi_arr[user_input - 1].artist.name}" if user_input.between?(1, Song.all.length.to_i)
  end
  
end
    
    
# rspec spec/010_music_library_controller_spec.rb
# rspec spec/011_music_library_cli_methods_spec.rb
# rspec spec/012_music_library_cli_spec.rb
