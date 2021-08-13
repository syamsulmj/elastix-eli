defmodule ElastixEli.Services.ElasticsearchCluster do
  use Elasticsearch.Cluster, otp_app: :elastix_eli
end
