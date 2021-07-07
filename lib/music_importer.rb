# music_importer module rspec: rspec spec/009_music_importer_spec.rb

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    messy_files = Dir.glob("#{@path}/*.mp3")
    subst = "./spec/fixtures/mp3s/"
    clean_files = []
    messy_files.each do |messy_file|
      clean_files<<messy_file[subst.size..-1]
    end
    clean_files
  end

  def import
    files.each do |file_name|
  #    info_array = file.split(" - ")
    Song.create_from_filename(file_name)
    end
  end

end
