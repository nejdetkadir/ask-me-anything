class AddSomeFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    # column
    add_column :users, :username, :string
    add_column :users, :fullname, :string
    add_column :users, :bio, :string
    add_column :users, :location, :string
    add_column :users, :website, :string
    add_column :users, :profile_img, :string
    add_column :users, :background_img, :string
    add_column :users, :birthday, :date
    add_column :users, :slug, :string

    # index
    add_index :users, :slug, unique: true
  end
end
