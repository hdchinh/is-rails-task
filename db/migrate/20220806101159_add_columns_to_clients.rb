class AddColumnsToClients < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :email, :string, null: false
    add_column :clients, :password_digest, :string, null: false
  end
end
