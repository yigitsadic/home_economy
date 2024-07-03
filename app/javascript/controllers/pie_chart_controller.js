import { Controller } from "@hotwired/stimulus"
import '@chartjs';

// Connects to data-controller="pie-chart"
export default class extends Controller {
  static targets = ["canvas"]

  connect() {
    new Chart(this.canvasTarget, {
      type: "pie",
      data: {
        labels: ["Expense", "Investment", "Available"],
        datasets: [{
          data: [this.expense, this.investment, this.available],
          backgroundColor: [
            "#dc3545",
            "#ffc107",
            "#0dcaf0"
          ],
          hoverOffset: 4
        }]
      },
    });
  }

  initialize() {
    this.expense = this.element.dataset.expense
    this.investment = this.element.dataset.investment
    this.available = this.element.dataset.available
  }
}
