class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :article
      t.date :date
      t.text :banner
      t.string :category
      t.references :user

      t.timestamps
    end
  end
end
