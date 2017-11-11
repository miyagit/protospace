class CreatePrototypes < ActiveRecord::Migration[5.0]
  def change
    create_table :prototypes do |t|
    	t.string :title, null: false, default: ""
    	t.text :concept
    	t.string :catch_copy, null: false, default: ""
    	t.references :user, index: true, foreign_key: true
    	t.integer :likes_count
      t.timestamps
    end
  end
end
