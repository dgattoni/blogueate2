json.array!(@posts) do |post|
  json.extract! post, :id, :entryTitle, :entryContent, :blog_id
  json.url post_url(post, format: :json)
end
