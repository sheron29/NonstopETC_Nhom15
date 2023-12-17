import realtimeDB from "./firebase";
import React, { useEffect, useState } from "react";
import { ref, child, get, onValue } from "firebase/database";
import { MaterialReactTable } from "material-react-table";

const Table = () => {
  const [result, setResult] = useState(null);

  useEffect(() => {
    const starCountRef = ref(realtimeDB, 'data');
    onValue(starCountRef, (snapshot) => {
      const data = snapshot.val();

      const dates = Object.values(data.date);
      const speeds = Object.values(data.speed);
      const times = Object.values(data.time);

      const result = dates.map((date, index) => ({
        date,
        speed: speeds[index],
        time: times[index],
      }));

      setResult(result);
    });
  }, []);

  const columns = [
    {
      accessorKey: "date",
      header: "Date",
      cellRenderer: (rowData) => (
        <div style={{ textAlign: "center" }}>{rowData.date}</div>
      ),
    },
    {
      accessorKey: "time",
      header: "Time",
      cellRenderer: (rowData) => (
        <div style={{ textAlign: "center" }}>{rowData.time}</div>
      ),
    },
    {
      accessorKey: "speed",
      header: "Speed",
      cellRenderer: (rowData) => (
        <div style={{ textAlign: "center" }}>{rowData.speed}</div>
      ),
    },
  ];

  return (
    <div style={{margin:100,}}>
      <div >
      {result && <MaterialReactTable columns={columns} data={result}  />}
      </div>
    </div>
  );
};

export default Table;