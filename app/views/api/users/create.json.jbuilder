json.success true
json.message "Client was created successfully"
json.data { json.call(@current_client, :id, :email) }
