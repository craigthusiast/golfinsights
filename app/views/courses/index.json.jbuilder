json.array!(@courses) do |course|
  json.extract! course, :id, :name, :par, :rating, :slope, :favourite, :tees
  json.url course_url(course, format: :json)
end
