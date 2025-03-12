defmodule HelloToastWeb.FrontPageLive do
  use HelloToastWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="flex flex-col gap-3">
      <span class="p-2 bg-red-300 mx-auto">First page</span>
      <button class="p-2 bg-blue-200" phx-click="nav">
        put toast and push_navigate to second page
      </button>
      <button class="p-2 bg-green-200" phx-click="no-nav">
        send toast and no navigation
      </button>
    </div>
    """
  end

  def handle_event("nav", _unsigned_params, socket) do
    {:noreply,
     socket
     |> push_navigate(to: ~p"/page-2")
     |> LiveToast.put_toast(:info, "We toasting, but should be my own component",
       component: &test_comp/1
     )}
  end

  def handle_event("no-nav", _unsigned_params, socket) do
    LiveToast.send_toast(:info, "We Toasting", component: &test_comp/1)
    {:noreply, socket}
  end

  def test_comp(assigns) do
    ~H"""
    My component first page
    """
  end
end
