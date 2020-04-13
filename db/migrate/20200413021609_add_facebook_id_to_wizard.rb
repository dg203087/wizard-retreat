class AddFacebookIdToWizard < ActiveRecord::Migration[6.0]
  def change
    add_column :wizards, :UID, :string
  end
end
