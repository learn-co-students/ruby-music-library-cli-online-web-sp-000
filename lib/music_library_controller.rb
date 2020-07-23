class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end
  
  def call
    
    reply = ""
    
    until reply == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
    
      reply = gets
      
      case reply
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
    songs = Song.all
    songs.sort_by! {|song| song.name}
    i = 0
    
    while i < songs.length
      puts "#{i + 1}. #{songs[i].artist.name} - #{songs[i].name} - #{songs[i].genre.name}"
      i += 1
    end
  end
  
  def list_artists
    artists = Artist.all
    artists.sort_by! {|artist| artist.name}
    i = 0
    
    while i < artists.length
      puts "#{i + 1}. #{artists[i].name}" 
      i += 1
    end
  end
  
  def list_genres
    genres = Genre.all
    genres.sort_by! {|genre| genre.name}
    i = 0
    
    while i < genres.length
      puts "#{i + 1}. #{genres[i].name}"
      i += 1
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    reply = gets.strip
    
    artist = nil
    artist = Artist.all.detect {|item| item.name == reply}
    
    if artist
      songs = artist.songs
      songs.sort_by! {|song| song.name}
      i = 0
    
      while i < songs.length
        puts "#{i + 1}. #{songs[i].name} - #{songs[i].genre.name}"
        i += 1
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    reply = gets.strip
    
    genre = nil
    genre = Genre.all.detect {|item| item.name == reply}
    
    if genre
      songs = genre.songs
      songs.sort_by! {|song| song.name}
      i = 0
      
      while i < songs.length
        puts "#{i + 1}. #{songs[i].artist.name} - #{songs[i].name}"
        i += 1
      end
    end
  end
  
  def play_song
    #list_songs
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    songs = Song.all
    songs.sort_by! {|song| song.name}
    
    if (song_number > 0) && (song_number <= songs.length)
      if songs[song_number - 1]
        puts "Playing #{songs[song_number - 1].name} by #{songs[song_number - 1].artist.name}"
      end
    end
    
  end
  
end