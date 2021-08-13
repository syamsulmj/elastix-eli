defmodule ElastixEli.Schema.Post do
  use ElastixEli.Schema

  @allow [
    :title,
    :author,
    :content
  ]

  @required [
    :title,
    :author
  ]

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "posts" do
    field :title, :string
    field :author, :string
    field :content, :string

    timestamps()
  end

  @doc false
  def changeset(struct, attrs) do
    struct
    |> cast(attrs, @allow)
    |> validate_required(@required)
  end
end
