json.extract! post, :id, :titulo, :descripcion, :estado, :created_at, :updated_at
json.url post_url(post, format: :json)
