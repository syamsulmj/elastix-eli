defmodule ElastixEli.Repo do
  use Ecto.Repo,
    otp_app: :elastix_eli,
    adapter: Ecto.Adapters.Postgres

  def insert_with_es(changeset, index_name) do
    case insert(changeset) do
      {:ok, data} ->
         Elasticsearch.put_document(ElastixEli.Services.ElasticsearchCluster, data, index_name)

         {:ok, data}
      {:error, error} ->
        {:error, error}
    end
  end
end
