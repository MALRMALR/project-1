class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :discipline
      t.text   :artist_statement
      t.string :location
      t.string :contact_info
      t.string :instagram
      t.string :facebook
      t.string :twitter
      t.string :website
      t.string :password_digest

      t.timestamps

    end
  end
end
