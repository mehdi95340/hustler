import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

// Connects to data-controller="chart"
export default class extends Controller {
  static targets = ["canvas"];
  static values = {
    labels: Array,
    data: Array
  };

  connect() {
    const ctx = this.canvasTarget;

    if (ctx && this.hasLabelsValue && this.hasDataValue) {
      this.chart = new Chart(ctx, {
        type: "doughnut",
        data: {
          labels: this.labelsValue,
          datasets: [{
            label: "",
            data: this.dataValue,
            backgroundColor: [
              "red",
              "green"
            ],
            borderColor: [
              "green",
              "red"
            ],
            borderWidth: 1
          }]
        },
        options: {
          responsive: true,
          cutout: '50%', // makes hole in doughnut
          plugins: {
            legend: {
              position: "top", //where remaining budget are total budget and remaining expense

            },
            tooltip: {
              callbacks: {
                label: function(tooltipItem) {
                  return tooltipItem.label + ": " + tooltipItem.raw + "%";
                }
              }
            }
          }
        }
      });
    }
  }
  disconnect() {
    if (this.chart) {
      this.chart.destroy();
    }
  }
}
