require_relative '20140711151211_create_comments'
class FixCommentMigration < ActiveRecord::Migration
  def change
    revert CreateComments

    create_table(:comments) do |t|
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
