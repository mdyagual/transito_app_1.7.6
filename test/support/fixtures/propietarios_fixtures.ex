defmodule TransitoApp.PropietariosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TransitoApp.Propietarios` context.
  """

  @doc """
  Generate a propietario.
  """
  def propietario_fixture(attrs \\ %{}) do
    {:ok, propietario} =
      attrs
      |> Enum.into(%{
        apellido: "some apellido",
        fecha_nac: ~D[2023-07-03],
        nombre: "some nombre",
        num_id: "some num_id"
      })
      |> TransitoApp.Propietarios.create_propietario()

    propietario
  end
end
