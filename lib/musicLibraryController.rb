require 'pry'

class MusicLibraryController


def initialize(path='./db/mp3s')
   MusicImporter.new(path).import
   binding.pry
end

def call
input=""
while input !="exit"
puts "Welcome to your music library!"
puts "To list all of your songs, enter 'list songs'."
puts "To list all of the artists in your library, enter 'list artists'."
puts "To list all of the genres in your library, enter 'list genres'."
puts "To list all of the songs by a particular artist, enter 'list artist'."
puts "To list all of the songs of a particular genre, enter 'list genre'."
puts "To play a song, enter 'play song'."
puts "To quit, type 'exit'."
puts "What would you like to do?"

input=gets.strip
end
end

def list_songs
  #what MusicLibraryController is essentially is an array of Song objects?Wrong! it is an object and i cannot just treat it as anarray!
  #and what we want to do is to get the name of songs, alphabetize them and then loop over them and iject a number to it
  #so i think compare to deal with the music_library_controller, which is MusicImporter.import actually, i should work on the MusicImporter
  #directly, so i save the trouble to reintegrate info of Song object to make it look like a file name(.......mp3)


  #or my second way of implementing this is firstly grab the name of the song.object, and then when i get
  #a new array of song objects, i can then loop over the object and integrate all info into a name of a song
  song_list=Song.all.sort{|x,y|x.name<=>y.name}
  song_list.collect.with_index do |object,i|
    puts "#{i+1}. #{object.artist.name} - #{object.name} - #{object.genre.name}"

  end
end
end
