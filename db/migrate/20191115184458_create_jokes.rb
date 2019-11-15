class CreateJokes < ActiveRecord::Migration[5.2]
  def change
    create_table :jokes do |t|
      t.string :joke
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps
    end
  end
end
