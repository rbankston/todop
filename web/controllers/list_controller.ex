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

   def create(conn, %{"list" => name}) do
   changeset = List.changeset(%List{}, name)


   case Repo.insert(changeset) do
    {:ok, _name} ->
      conn
      |> put_flash(:info, "List Created")
     |> redirect(to: list_path(conn, :index))
     {:error, changeset} ->
       render conn, "new.html", changeset: changeset
      end
  end

end
