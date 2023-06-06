class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    Genre.find(self.genre_id).name
  end

  def drake_made_this
    Artist.find_or_create_by(name: "Drake")
    Song.create(name: self.name, artist_id: Artist.find_by(name: "Drake").id)
    self.artist_id = Artist.find_by(name: "Drake").id
  end
end