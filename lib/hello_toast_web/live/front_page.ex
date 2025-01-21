defmodule HelloToastWeb.FrontPageLive do
  use HelloToastWeb, :live_view

  def render(assigns) do
    ~H"""
    Front page <.link class="p-2 bg-red-200" href="/page-2"> link to 2-page </.link>
    """
  end
end
