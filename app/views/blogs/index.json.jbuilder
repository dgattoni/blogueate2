json.array!(@blogs) do |blog|
  json.extract! blog, :id, :siteTitle, :siteDescription, :siteHeader, :user_id
  json.url blog_url(blog, format: :json)
end
