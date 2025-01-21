defmodule HelloToastWeb.SecondPageLive do
  use HelloToastWeb, :live_view

  def render(assigns) do
    ~H"""
    Second page
    <button class="p-2 bg-blue-200" phx-click="nav">put toast and push_navigate to front page</button>
    """
  end

  def handle_event("nav", _unsigned_params, socket) do
    LiveToast.send_toast(:info, "navigated from page two")
    {:noreply, socket |> push_navigate(to: ~p"/")}
  end
end
