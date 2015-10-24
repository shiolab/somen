class ChangeReferenceIdOnSentLogs < ActiveRecord::Migration
  def change
    change_column_default :sent_logs, :created_at, nil
    change_column_default :sent_logs, :updated_at, nil

    add_column :sent_logs, :mailform_history_id, :integer
  end
end
