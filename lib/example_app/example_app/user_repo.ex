defmodule ExampleApp.UserRepo do
  @moduledoc false

  import Ecto.Query, only: [from: 2]

  alias ExampleApp.{Repo, User}


  def find_confirmaded do

    query =
      from(
        u in User,
        where: u.confirmed == true,
        select: u.username
      )

      Repo.all(query)
  end


  def count_confimed do
    query = from(
      u in User,
      where: u.confimed == "true",
      select: count(u.id)
    )

    Repo.all(query)
  end

end
