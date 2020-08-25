class MusicLibraryController

def initialize(path = './db/mp3s')
  newimporterinstance = MusicImporter.new(path)
  newimporterinstance.import() #will create songs
end

def call
#this chunk of 10-ish messages get reprinted a lot after each input, unless the input is exit
  loop do
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
#we collect input, do what they want, then replay the 10 messages
#this is kind of a fake app. too simple. user can't choose which artist which song which genre at all
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
when "exit"
  return #finish this call method
else #invalid input. will end this case and continue to loop with 10 messages
end #end of case
end #end of loop

end #end method



def list_songs
  # songs must be alphabetized. fucking crazy

  #note: the original Song.all is not mutated.
  sortedsongarray = Song.all.sort_by do | song |
    song.name
  end

  sortedsongarray.each_with_index  do | song, index |
    puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"

  end

  sortedsongarray #we return this so it can be used later
end

def list_artists
  sortedartistarray = Artist.all.sort_by do | artist |
    artist.name
  end

  sortedartistarray.each_with_index  do | artist, index |
    puts "#{index+1}. #{artist.name}"
  end
end

def list_genres
  sortedgenrearray = Genre.all.sort_by do | genre |
    genre.name
  end

  sortedgenrearray.each_with_index  do | genre, index |
    puts "#{index+1}. #{genre.name}"
  end

end

def list_songs_by_artist
  #ask input
  puts "Please enter the name of an artist:"
  input = gets.strip #ex: beyonce
  #find
  result = Artist.all.find do | artist |
    artist.name == input
  end
   #ex: return beyonce artist instance or nil

    #if found: print in alphatebtiezd order
    if result #truthy, not nil. if found: print in alphatebtiezd order
      sortedsongarray = result.songs.sort_by do | song |
        song.name
      end
      sortedsongarray.each_with_index  do | song, index |
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end


    else  #result = falsey value. if not found: does nothing
      return
    end #end if end block

end #end method

def list_songs_by_genre

  #ask input
  puts "Please enter the name of a genre:"
  input = gets.strip #ex: beyonce
  #find
  result = Genre.all.find do | genre |
    genre.name == input
  end
   #ex: return hiphop artist instance or nil

    #if found: print in alphatebtiezd order
    if result #truthy, not nil. if found: print in alphatebtiezd order
      sortedsongarray = result.songs.sort_by do | song |
        song.name
      end
      sortedsongarray.each_with_index  do | song, index |
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end

    else  #result = falsey value. if not found: does nothing
      return
    end #end if end block


end #end method

def play_song
    #ask input
    #warning: list_sosngs have Puts in its method, to saving its return still cause the puts to print output
    #so can't use list_songs
    #just do the alphabetizing again:
    sortedsongarray = Song.all.sort_by do | song |
      song.name
    end

    puts "Which song number would you like to play?"
    input = gets.strip.to_i  #ex: convert to integer. 3 means song 3. which is song index 2 in list_songs

    #WHY DOES IT SEEMS TO HAVE  C  A L L E D the list songs method, where i just want the return
    if input >= 1 && input <= sortedsongarray.length
      #list_songs return sortedsongarray
      songinstance = sortedsongarray[input-1]  #ex: if they want song 3, i do list_songs[2]
      puts "Playing #{songinstance.name} by #{songinstance.artist.name}"
    else
      return
    end
end #end method




end #end class

# hello = MusicLibraryController.new
# hello.call
