class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name,                  null: false
      t.integer :kind_id,              null: false
      t.integer :gender_id,            null: false
      t.text :description,             null: false
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
