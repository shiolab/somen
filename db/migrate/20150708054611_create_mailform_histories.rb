class CreateMailformHistories < ActiveRecord::Migration
  def change
    create_table :mailform_histories do |t|
      t.references :mailform
      t.string :sender
      t.string :subject
      t.text :body

      t.timestamps null: false
    end
  end
end
