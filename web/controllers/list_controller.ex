defmodule Todop.ListController do
  use Todop.Web, :controller

  alias Todop.List

  def index(conn, _params) do
    lists = Repo.all(List)
    render conn, "index.html", lists: lists
  end

  def new(conn, _params) do
    changeset = List.changeset(%List{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def delete(conn, %{"id" => list_id}) do
  Repo.get!(List, list_id)
  |> Repo.delete!

  conn
  |> put_flash(:info, "List Item Deleted")
  |> redirect(to: list_path(conn, :index))
end


   def create(conn, %{"list" => name}) do
   changeset = List.changeset(%List{}, name)


   case Repo.insert(changeset) do
    {:ok, _name} ->
      conn
      |> put_flash(:info, "List Item Created")
     |> redirect(to: list_path(conn, :index))
     {:error, changeset} ->
       render conn, "new.html", changeset: changeset
      end
  end

end
