defmodule AuthPlug do
  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _) do
    conn
    |> get_req_header("authorization")
    |> decode_auth()
    |> put_assigns(conn)
  end

  defp decode_auth([]), do: nil

  defp decode_auth(tok) do
    tok
    |> case do
      ["bearer " <> tok] -> tok
      ["Bearer " <> tok] -> tok
      _ -> nil
    end
    |> Secret.unpack()
    |> case do
      {:ok, %{"id" => _} = user} ->
        user

      _ ->
        nil
    end
  end

  defp put_assigns(nil, conn) do
    assign(conn, :user, nil)
  end

  defp put_assigns(%{"id" => id}, conn) do
    assign(conn, :user, id)
  end
end
