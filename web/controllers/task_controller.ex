defmodule Todop.TaskController do
  use Todop.Web, :controller

  alias Todop.List
  alias Todop.Task

  def new(conn, _params) do
    changeset = Task.changeset(%Task{}, %{})

    render conn, "new.html", changeset: changeset
  end
end
