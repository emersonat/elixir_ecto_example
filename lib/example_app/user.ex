defmodule ExampleApp.User do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field(:username, :string)
    field(:encrypted_password, :string)
    field(:email, :string)
    field(:confirmed, :boolean, default: false)

    #virtual
    field(:password, :string, virtual: true)
    field(:password_confirmation, :string, virtual: true)

    timestamps

  end

  @required_fields ~(username encrypted_password email)
  @optional_fields ~()



  def changeset(user, params \\ :empty) do
    user
    |> cast(params,@required_fields ++ @optional_fields )
    |> validade_required(@required_fields)
    |> unique_constraint(:username)
  end



end
