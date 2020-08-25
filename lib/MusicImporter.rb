require 'pry'
class MusicImporter
  attr_accessor :path

  def initialize(path)
    #path is a folder
    #you're supposed to go to the folder and see the files and import the filenames
    @path = path
    files() #if u call the files method elsewhere several times, it doens't duplicate. it just does the same work over again and nothing changes

  end

  def files
      #filenamesarray = Dir.entries(@path) #==>this pick up things like "." and ".."
      filepathsarray = Dir.glob("#{@path}/*.mp3")
      mp3strings = []
      filepathsarray.each do | filepath |
        chunks = filepath.split("/")
        mp3strings << chunks.last
      end
      @myfiles = mp3strings
    end

    def import #instnace method
      #apparently u must set the initialize method to call the files. otherwise nothing to import. @myfiles would be nil

      @myfiles.each do | filename |
        Song.create_from_filename(filename)
        #creat from filename uses new from FILEname, which uses find or new from NAME, (no file), so it should weed out duplicates
        #we expect to not have duplications
        #butit does happen
        #first import call makes twice the wanted amount. ex: amount 100. u get 200
        #next call adds another 100. next call another 100.
        #it's non-linear. which is crazy. very strange behavior


      end
      
    end



end #end class
