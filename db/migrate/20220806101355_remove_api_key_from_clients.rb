class RemoveApiKeyFromClients < ActiveRecord::Migration[6.1]
  def change
    remove_column :clients, :api_key
  end
end
