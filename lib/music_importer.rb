class MusicImporter
  require 'pry'

  def initialize(inputPath)
    @path = inputPath
    @files = []
  end

  def path
    @path
  end

  def files
    @files = Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    #binding.pry
  end

  def import
    self.files
    @files.each do | selectedFile |
      #binding.pry
      Song.create_from_filename(selectedFile)
    end
  end

end
