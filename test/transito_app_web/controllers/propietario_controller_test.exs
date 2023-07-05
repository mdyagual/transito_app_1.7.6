defmodule TransitoAppWeb.PropietarioControllerTest do
  use TransitoAppWeb.ConnCase

  import TransitoApp.PropietariosFixtures

  alias TransitoApp.Propietarios.Propietario

  @create_attrs %{
    apellido: "some apellido",
    fecha_nac: ~D[2023-07-03],
    nombre: "some nombre",
    num_id: "some num_id"
  }
  @update_attrs %{
    apellido: "some updated apellido",
    fecha_nac: ~D[2023-07-04],
    nombre: "some updated nombre",
    num_id: "some updated num_id"
  }
  @invalid_attrs %{apellido: nil, fecha_nac: nil, nombre: nil, num_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all propietarios", %{conn: conn} do
      conn = get(conn, ~p"/api/propietarios")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create propietario" do
    test "renders propietario when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/propietarios", propietario: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/propietarios/#{id}")

      assert %{
               "id" => ^id,
               "apellido" => "some apellido",
               "fecha_nac" => "2023-07-03",
               "nombre" => "some nombre",
               "num_id" => "some num_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/propietarios", propietario: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update propietario" do
    setup [:create_propietario]

    test "renders propietario when data is valid", %{conn: conn, propietario: %Propietario{id: id} = propietario} do
      conn = put(conn, ~p"/api/propietarios/#{propietario}", propietario: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/propietarios/#{id}")

      assert %{
               "id" => ^id,
               "apellido" => "some updated apellido",
               "fecha_nac" => "2023-07-04",
               "nombre" => "some updated nombre",
               "num_id" => "some updated num_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, propietario: propietario} do
      conn = put(conn, ~p"/api/propietarios/#{propietario}", propietario: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete propietario" do
    setup [:create_propietario]

    test "deletes chosen propietario", %{conn: conn, propietario: propietario} do
      conn = delete(conn, ~p"/api/propietarios/#{propietario}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/propietarios/#{propietario}")
      end
    end
  end

  defp create_propietario(_) do
    propietario = propietario_fixture()
    %{propietario: propietario}
  end
end
