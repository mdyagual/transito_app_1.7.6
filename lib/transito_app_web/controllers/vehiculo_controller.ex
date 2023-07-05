defmodule TransitoAppWeb.VehiculoController do
  use TransitoAppWeb, :controller

  alias TransitoApp.Vehiculos
  alias TransitoApp.Vehiculos.Vehiculo

  action_fallback TransitoAppWeb.FallbackController

  def index(conn, _params) do
    vehiculos = Vehiculos.list_vehiculos()
    render(conn, :index, vehiculos: vehiculos)
  end

  def create(conn, %{"vehiculo" => vehiculo_params}) do
    with {:ok, %Vehiculo{} = vehiculo} <- Vehiculos.create_vehiculo(vehiculo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/vehiculos/#{vehiculo}")
      |> render(:show, vehiculo: vehiculo)
    end
  end

  def show(conn, %{"id" => id}) do
    vehiculo = Vehiculos.get_vehiculo!(id)
    render(conn, :show, vehiculo: vehiculo)
  end

  def update(conn, %{"id" => id, "vehiculo" => vehiculo_params}) do
    vehiculo = Vehiculos.get_vehiculo!(id)

    with {:ok, %Vehiculo{} = vehiculo} <- Vehiculos.update_vehiculo(vehiculo, vehiculo_params) do
      render(conn, :show, vehiculo: vehiculo)
    end
  end

  def delete(conn, %{"id" => id}) do
    vehiculo = Vehiculos.get_vehiculo!(id)

    with {:ok, %Vehiculo{}} <- Vehiculos.delete_vehiculo(vehiculo) do
      send_resp(conn, :no_content, "")
    end
  end
end
