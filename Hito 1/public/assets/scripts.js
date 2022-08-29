const getData = async () => {
  const response = await fetch("/api/total");
  const { data } = await response.json();
  console.log(data);
  return data;
};
const fullData = await getData();
let chartDetail;

let tenData = [];
let coutriesLabels = [];
let activeCases = [];
let confirmCases = [];
let deathCases = [];
let recoverCases = [];

//obtencion 10 primeros paises
tenData = fullData.slice(0, 10);

tenData.forEach((element) => {
  coutriesLabels.push(element.location);
  //dato ficticio ya que la api retorna 0
  activeCases.push((element.active + 1) * parseInt(Math.random() * 10000000));
  confirmCases.push(element.confirmed);
  deathCases.push(element.deaths);
  //dato ficticio ya que la api retorna 0
  recoverCases.push(
    (element.recovered + 1) * parseInt(Math.random() * 10000000)
  );
});
const ctx = document.getElementById("myChart");
const myChart = new Chart(ctx, {
  type: "bar",
  data: {
    labels: coutriesLabels,
    datasets: [
      {
        label: "Casos confirmados",
        data: confirmCases,
        backgroundColor: "rgba(255, 206, 86, 0.2)",
        borderColor: "rgba(255, 206, 86, 1)",
        borderWidth: 1,
      },
      {
        label: "Casos Activos",
        data: activeCases,
        backgroundColor: "rgba(255, 99, 132, 0.2)",
        borderColor: "rgba(255, 99, 132, 1)",
        borderWidth: 1,
      },
      {
        label: "Muertos",
        data: deathCases,
        backgroundColor: "rgba(153, 102, 255, 0.2)",
        borderColor: "rgba(153, 102, 255, 1)",
        borderWidth: 1,
      },
      {
        label: "Casos recuperados",
        data: recoverCases,
        backgroundColor: "rgba(75, 192, 192, 0.2)",
        borderColor: "rgba(75, 192, 192, 1)",
        borderWidth: 1,
      },
    ],
  },
  options: {
    scales: {
      yAxes: [
        {
          ticks: {
            beginAtZero: true,
          },
        },
      ],
    },
  },
});

// Function to demonstrate calling grid's API
function deselect() {
  gridOptions.api.deselectAll();
}

// Grid Options are properties passed to the grid
const gridOptions = {
  // each entry here represents one column
  columnDefs: [
    { field: "location" },
    { field: "confirmed" },
    { field: "deaths" },
    { field: "recovered" },
    { field: "active" },
    { field: "Detalles" },
  ],

  // default col def properties get applied to all columns
  defaultColDef: { sortable: true },

  rowSelection: "multiple", // allow rows to be selected
  animateRows: true, // have rows animate to new positions when sorted

  // example event handler
  onCellClicked: (params) => {
    console.log("cell was clicked", params.data);
    $("#exampleModal").modal("show");
    const pieChart = document.getElementById("donnut");
    const donnut = new Chart(pieChart, {
      type: "doughnut",
      data: {
        labels: [ "Casos confirmados", "Muertes"],
        datasets: [
          {
            data: [params.data.confirmed, params.data.deaths],
            backgroundColor: [ "rgba(153, 102, 255, 0.2)", "rgba(255, 206, 86, 0.2)"],
          },
        ],
      },
    });
  },
};

// get div to host the grid
const eGridDiv = document.getElementById("myGrid");
// new grid instance, passing in the hosting DIV and Grid Options
new agGrid.Grid(eGridDiv, gridOptions);
gridOptions.api.setRowData(fullData);
