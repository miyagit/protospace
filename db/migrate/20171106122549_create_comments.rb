class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
    	t.string :content, null: false, default: ""
    	t.references :user, index: true, foreign_key: true
    	t.references :prototype, index: true, foreign_key: true
      t.timestamps
    end
  end
end
