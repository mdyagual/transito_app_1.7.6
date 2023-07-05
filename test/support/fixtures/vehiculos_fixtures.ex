defmodule TransitoApp.VehiculosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TransitoApp.Vehiculos` context.
  """

  @doc """
  Generate a vehiculo.
  """
  def vehiculo_fixture(attrs \\ %{}) do
    {:ok, vehiculo} =
      attrs
      |> Enum.into(%{
        anio: "some anio",
        color: "some color",
        marca: "some marca",
        modelo: "some modelo",
        placa: "some placa",
        tipo: "some tipo"
      })
      |> TransitoApp.Vehiculos.create_vehiculo()

    vehiculo
  end
end
