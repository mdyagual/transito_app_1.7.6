defmodule TransitoAppWeb.PropietarioJSON do
  alias TransitoApp.Vehiculos.Vehiculo
  alias TransitoApp.Propietarios.Propietario

  @doc """
  Renders a list of propietarios.
  """
  def index(%{propietarios: propietarios}) do
    %{data: for(propietario <- propietarios, do: data(propietario))}
  end

  @doc """
  Renders a single propietario.
  """
  def show(%{propietario: propietario}) do
    %{data: data(propietario)}
  end

  defp data(%Propietario{} = propietario) do

    %{
      id: propietario.id,
      num_id: propietario.num_id,
      nombre: propietario.nombre,
      apellido: propietario.apellido,
      fecha_nac: propietario.fecha_nac,
      vehiculos: for(v <- propietario.vehiculos, do: data_vehiculos(v)) #Many vehiculos
    }
  end

  #Structure to load vehiculos
  defp data_vehiculos(%Vehiculo{} = vehiculo) do
    %{
      id: vehiculo.id,
      anio: vehiculo.anio,
      color: vehiculo.color,
      marca: vehiculo.marca,
      modelo: vehiculo.modelo,
      placa: vehiculo.placa,
      tipo: vehiculo.tipo
    }
  end

end
