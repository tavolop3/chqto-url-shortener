class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :url
      t.string :slug
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :type
      t.datetime :expiration_date
      t.string :password
      t.integer :accesses_count

      t.timestamps
    end
    add_index :links, :slug
  end
end
