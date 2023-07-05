defmodule TransitoAppWeb.VehiculoJSON do
  alias TransitoApp.Vehiculos.Vehiculo
  alias TransitoApp.Propietarios.Propietario
  @doc """
  Renders a list of vehiculos.
  """
  def index(%{vehiculos: vehiculos}) do
    %{data: for(vehiculo <- vehiculos, do: data(vehiculo))}
  end

  @doc """
  Renders a single vehiculo.
  """
  def show(%{vehiculo: vehiculo}) do
    %{data: data(vehiculo)}
  end

  defp data(%Vehiculo{} = vehiculo) do
    %{
      id: vehiculo.id,
      placa: vehiculo.placa,
      tipo: vehiculo.tipo,
      marca: vehiculo.marca,
      modelo: vehiculo.modelo,
      color: vehiculo.color,
      anio: vehiculo.anio,
      propietario: data_propietario(vehiculo.propietario) #A single propietario
    }
  end

  #Structure to load propietarios
  defp data_propietario(propietario) when is_nil(propietario), do: :ok

  defp data_propietario(%Propietario{} = propietario) do
    %{
      id: propietario.id,
      num_id: propietario.num_id,
      nombre: propietario.nombre,
      apellido: propietario.apellido,
      fecha_nac: propietario.fecha_nac
    }
  end


end
