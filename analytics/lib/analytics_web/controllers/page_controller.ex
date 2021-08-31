defmodule AnalyticsWeb.PageController do
  use AnalyticsWeb, :controller

  def index(conn, _params) do
    jwk = %{
      "kty" => "oct",
      "k" => :jose_base64url.encode(Application.fetch_env!(:analytics, :jwt_secret))
    }

    if conn.cookies["session"] do
      {result, session, _} = JOSE.JWT.verify(
        jwk,
        conn.cookies["session"]
      )

      conn
      |> assign(:user, session.fields)
      |> render(:index)
    else
      url = "#{Application.fetch_env!(:analytics, :store_url)}?message=You need to be logged in!"

      conn
      |> put_status(:temporary_redirect)
      |> redirect(external: url)
    end
  end
end
