defmodule JiujitsumindWeb.PositionLive.Index do
  use JiujitsumindWeb, :live_view

  alias Jiujitsumind.Positions

  def mount(_params, _session, socket) do
    positions = Positions.list_positions()
    {:ok, assign(socket, positions: positions, search: "")}
  end

  def handle_event("search", %{"query" => query}, socket) do
    positions = Positions.search_positions(query)
    {:noreply, assign(socket, positions: positions, search: query)}
  end

  def render(assigns) do
    ~H"""
    <div class="container mx-auto p-4">
      <h1 class="text-2xl font-bold mb-4">BJJ Positionen</h1>
      
      <input
        type="text"
        placeholder="Suche nach Position..."
        phx-debounce="300"
        phx-keyup="search"
        class="border p-2 w-full mb-4"
      />
      <ul class="space-y-4">
        <%= for position <- @positions do %>
          <li class="p-4 border rounded-lg shadow-md">
            <h2 class="text-xl font-semibold"><%= position.name %></h2>
            
            <p><%= position.description %></p>
            
            <p class="text-sm text-gray-600">
              Kategorie: <%= position.category %>, Schwierigkeit: <%= position.difficulty %>
            </p>
            
            <a href={position.youtube_link} target="_blank" class="text-blue-500 underline">
              YouTube Technik
            </a>
          </li>
        <% end %>
      </ul>
    </div>
    """
  end
end
