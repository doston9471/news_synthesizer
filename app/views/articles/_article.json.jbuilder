json.extract! article, :id, :headline, :textonly, :date_published, :textorig, :created_at, :updated_at
json.url article_url(article, format: :json)
