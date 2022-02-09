json.extract! jrbook, :id, :name, :author, :read, :book_rating, :created_at, :updated_at
json.url jrbook_url(jrbook, format: :json)
