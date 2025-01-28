defmodule Calculator do
  def to_ast(string) do
    with {:ok, tokens, _} <- :lexer.string(String.to_charlist(string)),
         {:ok, ast} <- :parser.parse(tokens) do
      {:ok, ast}
    end
  end

  def run(string) do
    with {:ok, ast} <- to_ast(string) do
      {:ok, eval(ast)}
    end
  end

  defp eval({:=, lhs, rhs}), do: eval(lhs) == eval(rhs)
  defp eval({:+, lhs, rhs}), do: eval(lhs) + eval(rhs)
  defp eval({:-, lhs, rhs}), do: eval(lhs) - eval(rhs)
  defp eval({:*, lhs, rhs}), do: eval(lhs) * eval(rhs)
  defp eval({:/, lhs, rhs}), do: eval(lhs) / eval(rhs)
  defp eval({:int, _loc, value}), do: value
  defp eval({:float, _loc, value}), do: value
end
