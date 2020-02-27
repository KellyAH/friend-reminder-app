json.extract! event, :id, :title, :date_attended, :note, :friend_id, :created_at, :updated_at
json.url event_url(event, format: :json)
