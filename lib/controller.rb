class MusicLibraryController
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
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

      request = gets.strip
      if request == 'exit'
      elsif request == 'list_songs'
        list_songs
        call
      else
        call
      end
  end

  def list_songs
    #get all songs, reference the s.name of each song and sort, then return sortedarray
    sortedSongs = Song.all.sort! {|a,b| a.name <=> b.name}
    # alphabetized = []
    sortedSongs.each_with_index do |s, i|
      # puts alphabetized << "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    sortedArtists = Artist.all.sort! {|a,b| a.name <=> b.name}
    sortedArtists.each_with_index do |a, i|
      puts "#{i+1}. #{a.name}"
    end
  end

  def list_genres
    sortedGenres = Genre.all.sort! {|a,b| a.name <=> b.name}
    sortedGenres.each_with_index do |g, i|
      puts "#{i+1}. #{g.name}"
    end
  end

  def list_songs_by_artist
    songsOfArtist = []

    puts "Please enter the name of an artist:"
    target = gets.strip
    Song.all.each do |s|
      if s.artist.name == target
        songsOfArtist << s
      end
    end

    sortedSongs = songsOfArtist.sort! {|a,b| a.name <=> b.name}
    # alphabetized = []
    sortedSongs.each_with_index do |s, i|
      # puts alphabetized << "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      puts "#{i+1}. #{s.name} - #{s.genre.name}"
    end
  end

  def list_songs_by_genre
    songsOfGenre = []

    puts "Please enter the name of a genre:"
    target = gets.strip
    Song.all.each do |s|
      if s.genre.name == target
        songsOfGenre << s
      end
    end

    sortedSongs = songsOfGenre.sort! {|a,b| a.name <=> b.name}
    # alphabetized = []
    sortedSongs.each_with_index do |s, i|
      # puts alphabetized << "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      puts "#{i+1}. #{s.artist.name} - #{s.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    target = gets.strip
    sortedSongs = Song.all.sort! {|a,b| a.name <=> b.name}
    # binding.pry
    p = sortedSongs[target]
    # puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    puts "Playing #{p.name} by #{p.artist.name}"
  end
end
