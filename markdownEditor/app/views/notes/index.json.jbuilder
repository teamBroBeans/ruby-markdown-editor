json.array!(@notes) do |note|
  json.extract! note, :id, :title, :tag, :inputText
  json.url note_url(note, format: :json)
end
