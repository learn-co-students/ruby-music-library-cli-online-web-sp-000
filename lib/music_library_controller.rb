class MusicLibraryController 
  def initialize(path='./db/mp3s/')
    call
  end 
  def call 
    puts "Please put in the filepath for desired MP3's."
    path = gets.strip 
    importer = MusicImporter.new(path)
  end 
end 