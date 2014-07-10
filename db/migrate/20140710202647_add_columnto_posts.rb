class AddColumntoPosts < ActiveRecord::Migration
  def change
    add_column :posts, :embed_link, :string
    remove_column :posts, :banner, :text
  end
end
