defmodule TransitoApp.VehiculosTest do
  use TransitoApp.DataCase

  alias TransitoApp.Vehiculos

  describe "vehiculos" do
    alias TransitoApp.Vehiculos.Vehiculo

    import TransitoApp.VehiculosFixtures

    @invalid_attrs %{anio: nil, color: nil, marca: nil, modelo: nil, placa: nil, tipo: nil}

    test "list_vehiculos/0 returns all vehiculos" do
      vehiculo = vehiculo_fixture()
      assert Vehiculos.list_vehiculos() == [vehiculo]
    end

    test "get_vehiculo!/1 returns the vehiculo with given id" do
      vehiculo = vehiculo_fixture()
      assert Vehiculos.get_vehiculo!(vehiculo.id) == vehiculo
    end

    test "create_vehiculo/1 with valid data creates a vehiculo" do
      valid_attrs = %{anio: "some anio", color: "some color", marca: "some marca", modelo: "some modelo", placa: "some placa", tipo: "some tipo"}

      assert {:ok, %Vehiculo{} = vehiculo} = Vehiculos.create_vehiculo(valid_attrs)
      assert vehiculo.anio == "some anio"
      assert vehiculo.color == "some color"
      assert vehiculo.marca == "some marca"
      assert vehiculo.modelo == "some modelo"
      assert vehiculo.placa == "some placa"
      assert vehiculo.tipo == "some tipo"
    end

    test "create_vehiculo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vehiculos.create_vehiculo(@invalid_attrs)
    end

    test "update_vehiculo/2 with valid data updates the vehiculo" do
      vehiculo = vehiculo_fixture()
      update_attrs = %{anio: "some updated anio", color: "some updated color", marca: "some updated marca", modelo: "some updated modelo", placa: "some updated placa", tipo: "some updated tipo"}

      assert {:ok, %Vehiculo{} = vehiculo} = Vehiculos.update_vehiculo(vehiculo, update_attrs)
      assert vehiculo.anio == "some updated anio"
      assert vehiculo.color == "some updated color"
      assert vehiculo.marca == "some updated marca"
      assert vehiculo.modelo == "some updated modelo"
      assert vehiculo.placa == "some updated placa"
      assert vehiculo.tipo == "some updated tipo"
    end

    test "update_vehiculo/2 with invalid data returns error changeset" do
      vehiculo = vehiculo_fixture()
      assert {:error, %Ecto.Changeset{}} = Vehiculos.update_vehiculo(vehiculo, @invalid_attrs)
      assert vehiculo == Vehiculos.get_vehiculo!(vehiculo.id)
    end

    test "delete_vehiculo/1 deletes the vehiculo" do
      vehiculo = vehiculo_fixture()
      assert {:ok, %Vehiculo{}} = Vehiculos.delete_vehiculo(vehiculo)
      assert_raise Ecto.NoResultsError, fn -> Vehiculos.get_vehiculo!(vehiculo.id) end
    end

    test "change_vehiculo/1 returns a vehiculo changeset" do
      vehiculo = vehiculo_fixture()
      assert %Ecto.Changeset{} = Vehiculos.change_vehiculo(vehiculo)
    end
  end
end
