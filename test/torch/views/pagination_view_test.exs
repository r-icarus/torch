defmodule Torch.PaginationViewTest do
  @moduledoc false
  use ExUnit.Case

  import Phoenix.HTML, only: [safe_to_string: 1]
  import Torch.PaginationView

  doctest Torch.PaginationView, import: true

  describe "prev_link/4" do
    test "when current page is 1" do
      refute prev_link(%Plug.Conn{params: %{}}, 1)
    end

    test "when current page is more than 1" do
      current_page = 2
      link = prev_link(%Plug.Conn{params: %{}}, current_page) |> safe_to_string()
      assert link =~ "?page=#{current_page - 1}"
    end
  end

  describe "next_link/4" do
    test "when current page is equal to num pages" do
      refute next_link(%Plug.Conn{}, 2, 2)
    end

    test "when current page is more than num pages" do
      current_page = 1
      link = next_link(%Plug.Conn{params: %{}}, current_page, 2) |> safe_to_string()
      assert link =~ "?page=#{current_page + 1}"
    end
  end
end
