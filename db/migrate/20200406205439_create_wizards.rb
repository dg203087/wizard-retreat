class CreateWizards < ActiveRecord::Migration[6.0]
  def change
    create_table :wizards do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :house
      t.boolean :admin

      t.timestamps
    end
  end
end
