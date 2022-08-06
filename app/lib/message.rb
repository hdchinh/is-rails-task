class Message
  def self.not_found(record = "record")
    "Sorry, #{record} not found."
  end

  def self.invalid_api_key
    "Invalid api-key"
  end

  def self.missing_api_key
    "Missing api-key"
  end
end
