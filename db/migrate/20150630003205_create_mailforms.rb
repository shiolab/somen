class CreateMailforms < ActiveRecord::Migration
  def change
    create_table :mailforms do |t|
      t.integer :organization_id
      t.string :sender
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
  end
end
