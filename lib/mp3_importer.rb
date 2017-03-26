class MP3Importer
  attr_reader :path
  # we only need to be able to read the path

  def initialize(path)
    @path = path
    # accepts a file path to parse mp3 files from 
  end

  def files
   Dir.entries(@path).select { |file| file.include?(".mp3") }
   # selects all the .mp3 files in the directory @path
  end

  def import
    files.each do |artist_songname|
      song_array = artist_songname.split(" - ")
      name = song_array[0]
      song_name = song_array[1]
      artist = Artist.find_or_create_by_name(name)
      artist.add_song(song_name)
      # split at the - to separate artist name from song name
      # assign variables to both parts
      # create a new object initialized by artist_name set equal to the variable artist_name
      # add song to the newly created artist object using the song_name in the split
    end
  end
  
end