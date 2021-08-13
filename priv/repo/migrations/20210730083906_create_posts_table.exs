defmodule ElastixEli.Repo.Migrations.CreatePostsTable do
  use Ecto.Migration

  def change do
    create table("posts", primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string
      add :author, :string
      add :content, :text

      timestamps()
    end
  end
end
