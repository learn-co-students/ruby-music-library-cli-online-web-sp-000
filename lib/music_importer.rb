require 'pry'

require 'require_all'

class MusicImporter
  
  attr_accessor :path
  
  def initialize(path = '.db/mp3s')
    @path = path
  end

  def files
    @files = []
    file_folder = Dir.entries(@path)
    file_folder.each {|directory_file| @files << "#{directory_file}"}
    @files.delete_if{|character| character == "." || character == ".." || character == ".mp3"}
    @files
  end
  
  def file_parser
    files 
    artist_song_genre = music_importer.files.collect{|file| file.to_s.split(" - ").to_s}
    @artist_name = artist_song_genre[0]
    @genre_name = artist_song_genre[2]
    @song_name = artist_song_genre[1]
  end 
  
  def import
    files.
    file_parser
    new_song = Song.find_or_create_by_name(@song_name)
  end
  

end
