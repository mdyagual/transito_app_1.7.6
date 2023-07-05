defmodule TransitoAppWeb.Router do
  alias TransitoAppWeb.PropietarioController
  alias TransitoAppWeb.VehiculoController
  use TransitoAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    resources "/propietarios", PropietarioController, except: [:new, :edit, :update]
    put "/propietarios/:id", PropietarioController, :update

    resources "/vehiculos", VehiculoController, except: [:new, :edit, :update]
    put "/vehiculoss/:id", VehiculoController, :update
  end
end
