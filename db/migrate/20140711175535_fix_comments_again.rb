class FixCommentsAgain < ActiveRecord::Migration
  def change
    remove_column :comments, :author, :string

    add_column :comments, :author, :string
  end
end
