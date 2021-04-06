class CreateManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :managers do |t|
      t.string :username
      t.string :password_digest
      t.string :code
      t.integer :pharmacy_id

      t.timestamps
    end
  end
end
