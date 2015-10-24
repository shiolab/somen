class AddMailformHistoryIdToAccessLogs < ActiveRecord::Migration
  def change
    add_column :access_logs, :mailform_history_id, :integer
  end
end
