json.array! @results do |result|
  json.value result.id
  json.label result.name
end