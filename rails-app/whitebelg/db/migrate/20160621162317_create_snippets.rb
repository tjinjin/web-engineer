class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.integer :gist_id
      t.string :gist_url
      t.string :language
      t.text :plain_code
      t.text :highlighted_code
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
