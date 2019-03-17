defmodule Commanded.Event.Upcasting.EventHandler do
  use Commanded.Event.Handler, name: __MODULE__

  alias Commanded.Event.Upcasting.Events.{EventOne, EventTwo, EventThree, EventFour}

  def handle(%EventOne{} = e, _), do: send_reply(e)
  def handle(%EventTwo{} = e, _), do: send_reply(e)
  def handle(%EventThree{} = e, _), do: send_reply(e)
  def handle(%EventFour{} = e, _), do: send_reply(e)

  defp send_reply(%{reply_to: reply_to} = e) do
    send(:erlang.list_to_pid(reply_to), e)
    :ok
  end
end
