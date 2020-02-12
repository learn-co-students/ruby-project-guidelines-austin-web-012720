class CreateSongsArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :songs_artists do |t|
      t.integer :song_id
      t.integer :artist_id
    end
  end
end
