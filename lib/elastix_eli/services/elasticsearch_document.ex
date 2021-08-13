defimpl Elasticsearch.Document, for: ElastixEli.Schema.Post do
  def id(post), do: post.id
  def routing(_), do: false
  def encode(post) do
    %{
      title: post.title,
      author: post.author,
      content: post.content
    }
  end
end
