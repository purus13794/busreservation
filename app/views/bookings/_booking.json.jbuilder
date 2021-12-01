json.extract! booking, :id, :from, :to, :created_at, :updated_at
json.url booking_url(booking, format: :json)
