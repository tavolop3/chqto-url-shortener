json.extract! link, :id, :url, :slug, :user_id, :name, :type, :expiration_date, :password, :accesses_count, :created_at, :updated_at
json.url link_url(link, format: :json)
