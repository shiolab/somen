class AddLandingPageToMailforms < ActiveRecord::Migration
  def change
    add_column :mailforms, :landing_page, :string
  end
end
