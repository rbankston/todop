defmodule Todop.Task do
  use Todop.Web, :model

  schema "tasks" do
    field :name, :string
    field :done, :boolean, default: false
    belongs_to :lists, Todop.Lists

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :done])
    |> validate_required([:name, :done])
  end
end
