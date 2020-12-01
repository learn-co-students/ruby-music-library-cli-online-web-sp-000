class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{@path}/*"].collect {|file| File.basename(file)}
  end

  def import
    self.files.each {|file_name| Song.create_from_filename(file_name)}
  end

end

#rspec spec/010_music_library_controller_spec.rb
