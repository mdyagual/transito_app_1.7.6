defmodule TransitoApp.Propietarios.Propietario do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "propietarios" do
    field :apellido, :string
    field :fecha_nac, :date
    field :nombre, :string
    field :num_id, :string
    has_many :vehiculos, TransitoApp.Vehiculos.Vehiculo
    timestamps()
  end

  @doc false
  def changeset(propietario, attrs) do
    propietario
    |> cast(attrs, [:num_id, :nombre, :apellido, :fecha_nac])
    |> validate_required([:num_id, :nombre, :apellido, :fecha_nac])
  end
end

#has_many
#belongs_to