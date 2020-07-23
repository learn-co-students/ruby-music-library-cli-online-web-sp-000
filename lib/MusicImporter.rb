class MusicImporter
  
  attr_accessor :path, :fileArray, :dirArray
  
  @@all = []
  
  def initialize(filePath_str)
    @path = filePath_str
    @fileArray = []
    @@all << self
  end
  
  def path
    @path
  end
  
  def files
    @dirArray = Dir["#{self.path}/*.mp3"]
    @dirArray.each do |i|
      @fileArray << i.gsub("#{@path}/", "")
    end
    @fileArray
  end
  
  def import
    files.each do |i|
      Song.create_from_filename(i)
    end
  end

end
    
    
# Song Name, Artist, genre.mp3 
# rspec spec/009_music_importer_spec.rb
