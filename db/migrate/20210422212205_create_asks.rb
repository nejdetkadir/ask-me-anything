class CreateAsks < ActiveRecord::Migration[6.1]
  def change
    create_table :asks do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :friend_id, null: false
      t.string :ask, null: false, default: ""
      t.text :answer, null: false, default: ""
      t.boolean :is_anonymous, default: true
      t.string :answer_image
      
      t.timestamps
    end
  end
end
