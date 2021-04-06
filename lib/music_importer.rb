class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
   Dir.glob("#{path}/*.mp3").collect{ |file| file.gsub("#{path}/", "") }
  end

  def import
    files.each {|files| Song.create_from_filename(files)}
  end

end
# rspec spec/009_music_importer_spec.rb
