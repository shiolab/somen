class AddIsHiddenToMailforms < ActiveRecord::Migration
  def change
    add_column :mailforms, :is_hidden, :boolean
  end
end
