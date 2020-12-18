defmodule Test.AuthPlug do
  use ExUnit.Case

  describe "call/2" do
    test "an invalid header doesn't add a user to conn" do
      conn = Plug.Test.conn(:get, "/")
        |> Plug.Conn.put_req_header("authorization", "bearer 123")
        |> AuthPlug.call([])

      assert conn.assigns.user == nil
    end

    test "no header doesn't add a user to conn" do
      conn = Plug.Test.conn(:get, "/")
        |> AuthPlug.call([])

      assert conn.assigns.user == nil
    end

    test "proper header adds user" do
      {:ok, tok} = %{"user" => 123}
        |> Secret.pack()

      conn = Plug.Test.conn(:get, "/")
        |> Plug.Conn.put_req_header("authorization", "bearer #{tok}")
        |> AuthPlug.call([])

      assert conn.assigns.user == nil
    end
  end
end
