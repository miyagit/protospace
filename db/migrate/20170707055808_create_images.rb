class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
    	t.string :image, index: true,  null: false, default: ""
    	t.references :prototype, index: true, foreign_key: true
    	t.integer :status
      t.timestamps
    end
  end
end
