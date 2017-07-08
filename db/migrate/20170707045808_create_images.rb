class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
    	t.string :image, index: true,  null: false, default: ""
    	t.references :user, foreign_key: true
    	t.references :prototype, index: true, foreign_key: true
      t.timestamps
    end
  end
end
