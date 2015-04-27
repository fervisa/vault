json.array!(@credentials) do |credential|
  json.extract! credential, :id, :name, :login, :password, :url, :restrictions
  json.url credential_url(credential, format: :json)
end
