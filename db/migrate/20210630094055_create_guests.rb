class CreateGuests < ActiveRecord::Migration[6.1]
  def change
    create_table :guests, {:id => false} do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone

      t.timestamps
    end
    add_column :guests, :id, :primary_key
    add_index :guests, :email, unique: true
  end
end
