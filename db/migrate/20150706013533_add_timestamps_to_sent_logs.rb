class AddTimestampsToSentLogs < ActiveRecord::Migration
  def change
    add_column :sent_logs, :created_at, :datetime, null: false, default: Time.now
    add_column :sent_logs, :updated_at, :datetime, null: false, default: Time.now
  end
end
