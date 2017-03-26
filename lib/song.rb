class Song
  attr_accessor :name, :artist
  # need to be able to read and write to both

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    new_song = Song.new(song)
    new_song.artist_name = artist
    new_song
    # splits the filename at the - into two variables with a clever comma
    # creates a new song instance into a variable new_song
    # sets new_song's artist_name with the artist variable
    # returns the new_song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
    # if an artist exists add songs if not create new artist
  end

end
