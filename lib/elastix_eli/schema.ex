defmodule ElastixEli.Schema do
  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      import Ecto
      import Ecto.Query
      import Ecto.Changeset

      @derive {Jason.Encoder, except: [:__meta__]}
    end
  end
end
