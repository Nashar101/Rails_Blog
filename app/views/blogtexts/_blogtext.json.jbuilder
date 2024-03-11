json.extract! blogtext, :id, :owner, :created_at, :updated_at
json.url blogtext_url(blogtext, format: :json)
