defmodule TransitoApp.Vehiculos.Vehiculo do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "vehiculos" do
    field :anio, :string
    field :color, :string
    field :marca, :string
    field :modelo, :string
    field :placa, :string
    field :tipo, :string
    belongs_to :propietario, TransitoApp.Propietarios.Propietario
    timestamps()
  end

  @doc false
  def changeset(vehiculo, attrs) do
    vehiculo
    |> cast(attrs, [:placa, :tipo, :marca, :modelo, :color, :anio, :propietario_id])
    |> validate_required([:placa, :tipo, :marca, :modelo, :color, :anio])
  end
end
