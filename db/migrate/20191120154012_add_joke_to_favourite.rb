class AddJokeToFavourite < ActiveRecord::Migration[5.2]
  def change
    add_reference :favourites, :joke, foreign_key: true
  end
end
