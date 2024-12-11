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
              "#FF4D00",
              "#3A5044"
            ],
            borderColor: [
              "#FFAE8A",
              "#686868"
            ],
            borderWidth: 0.3
          }]
        },
        options: {
          responsive: true,
          cutout: '75%', // makes hole in doughnut
          plugins: {
            legend: {
              position: "top", //where remaining budget are total budget and remaining expense
              labels:{
                font: {
                  family: "Orbitron"
                },
                color:"white"
              }

            },
            tooltip: {
              callbacks: {
                label: function(tooltipItem) {
                  return tooltipItem.label + ": R" + tooltipItem.raw;
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
