defmodule TransitoAppWeb.PropietarioController do
  use TransitoAppWeb, :controller

  alias TransitoApp.Propietarios
  alias TransitoApp.Propietarios.Propietario
  alias TransitoApp.Vehiculos.Vehiculo
  alias TransitoApp.Vehiculos

  action_fallback TransitoAppWeb.FallbackController

  def index(conn, _params) do
    propietarios = Propietarios.list_propietarios()
    render(conn, :index, propietarios: propietarios)
  end

  def create(conn, %{"propietario" => propietario_params}) do
    with {:ok, %Propietario{} = propietario} <- Propietarios.create_propietario(propietario_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/propietarios/#{propietario}")
      |> render(:show, propietario: propietario)
    end
  end

  def show(conn, %{"id" => id}) do
    propietario = Propietarios.get_propietario!(id)
    render(conn, :show, propietario: propietario)
  end

  def update(conn, %{"id" => id, "propietario" => propietario_params}) do
    propietario = Propietarios.get_propietario!(id)

    with {:ok, %Propietario{} = propietario} <- Propietarios.update_propietario(propietario, propietario_params) do
      render(conn, :show, propietario: propietario)
    end
  end

  def delete(conn, %{"id" => id}) do
    propietario = Propietarios.get_propietario!(id)

    with {:ok, %Propietario{}} <- Propietarios.delete_propietario(propietario) do
      send_resp(conn, :no_content, "")
    end
  end

  #####

  #def get_vehiculos_propietario(conn, %{"id" => id}) do
  #  vehiculos = Propietarios.list_propietarios()
  #  render(conn, :get_vehiculos_propietario, vehiculos: vehiculos)  end
end
