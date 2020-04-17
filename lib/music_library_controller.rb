require 'pry'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    new_object = MusicImporter.new(path)
    new_object.import
    # binding.pry
  end
  
  def call
  end

end