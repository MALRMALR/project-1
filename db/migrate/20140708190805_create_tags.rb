class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :image
      t.string :video
      t.string :music
      t.string :literature
      t.string :news
      t.string :fashion

      t.references :posts
    end
  end
end
