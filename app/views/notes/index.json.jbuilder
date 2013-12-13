json.array!(@notes) do |note|
  json.extract! note, :id, :comment, :notes, :fish_id
  json.url note_url(note, format: :json)
end
