defmodule TransitoAppWeb.VehiculoControllerTest do
  use TransitoAppWeb.ConnCase

  import TransitoApp.VehiculosFixtures

  alias TransitoApp.Vehiculos.Vehiculo

  @create_attrs %{
    anio: "some anio",
    color: "some color",
    marca: "some marca",
    modelo: "some modelo",
    placa: "some placa",
    tipo: "some tipo"
  }
  @update_attrs %{
    anio: "some updated anio",
    color: "some updated color",
    marca: "some updated marca",
    modelo: "some updated modelo",
    placa: "some updated placa",
    tipo: "some updated tipo"
  }
  @invalid_attrs %{anio: nil, color: nil, marca: nil, modelo: nil, placa: nil, tipo: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all vehiculos", %{conn: conn} do
      conn = get(conn, ~p"/api/vehiculos")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create vehiculo" do
    test "renders vehiculo when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/vehiculos", vehiculo: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/vehiculos/#{id}")

      assert %{
               "id" => ^id,
               "anio" => "some anio",
               "color" => "some color",
               "marca" => "some marca",
               "modelo" => "some modelo",
               "placa" => "some placa",
               "tipo" => "some tipo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/vehiculos", vehiculo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update vehiculo" do
    setup [:create_vehiculo]

    test "renders vehiculo when data is valid", %{conn: conn, vehiculo: %Vehiculo{id: id} = vehiculo} do
      conn = put(conn, ~p"/api/vehiculos/#{vehiculo}", vehiculo: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/vehiculos/#{id}")

      assert %{
               "id" => ^id,
               "anio" => "some updated anio",
               "color" => "some updated color",
               "marca" => "some updated marca",
               "modelo" => "some updated modelo",
               "placa" => "some updated placa",
               "tipo" => "some updated tipo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, vehiculo: vehiculo} do
      conn = put(conn, ~p"/api/vehiculos/#{vehiculo}", vehiculo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete vehiculo" do
    setup [:create_vehiculo]

    test "deletes chosen vehiculo", %{conn: conn, vehiculo: vehiculo} do
      conn = delete(conn, ~p"/api/vehiculos/#{vehiculo}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/vehiculos/#{vehiculo}")
      end
    end
  end

  defp create_vehiculo(_) do
    vehiculo = vehiculo_fixture()
    %{vehiculo: vehiculo}
  end
end
