json.extract! trip, :id, :name, :user_id, :start_date, :end_date, :created_at, :updated_at
json.url trip_url(trip, format: :json)
