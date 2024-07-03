module MonthsHelper
  def month_pie_chart(month)
      attr = {
        "controller": "pie-chart",
        expense: month.total_expense,
        investment: month.total_investment,
        available: month.available_amount
      }
    content_tag(:div, data: attr) do
      content_tag(:canvas, "", data: { "pie-chart-target": "canvas" })
    end
  end
end
