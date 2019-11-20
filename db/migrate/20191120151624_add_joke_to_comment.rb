class AddJokeToComment < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :joke, foreign_key: true
  end
end
