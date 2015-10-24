class AddToToMailforms < ActiveRecord::Migration
  def change
    add_column :mailforms, :to, :text
  end
end
