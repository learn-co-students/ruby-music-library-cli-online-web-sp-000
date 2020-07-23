class MusicImporter
	@@all = []
  def initialize(path)
  	@path = path
  end

  def path
  	@path
  end

  def files
  	Dir.entries(@path).select {|f| !File.directory? f}
  end

 def import
 	files.each do |filename|
 	  Song.create_from_filename(filename)
 	end
 end

end
