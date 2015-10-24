class CreateSentLogs < ActiveRecord::Migration
  def change
    create_table :sent_logs do |t|
      t.integer :mailform_id
      t.string  :to
      t.string  :key
    end
  end
end
