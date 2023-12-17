// // Import the functions you need from the SDKs you need
// import { initializeApp } from "firebase/app";
// import { getDatabase } from "firebase/database";

// function StarFirebase() {
//   const firebaseConfig = {
//     apiKey: "AIzaSyC3DgDkwbuDRj55X6E08-i9qZGElh28n6M",
//     authDomain: "esp32-test-67f41.firebaseapp.com",
//     databaseURL: "https://esp32-test-67f41-default-rtdb.firebaseio.com",
//     projectId: "esp32-test-67f41",
//     storageBucket: "esp32-test-67f41.appspot.com",
//     messagingSenderId: "919488453332",
//     appId: "1:919488453332:web:c83fd4349097cbaeb53941",
//     measurementId: "G-EM7ZX5VQEF",
//   };
//   //   const firebaseConfig = {
//   //     apiKey: "AIzaSyDUiZP2Tle3vULsgDGN2zCp2t7D6RUNcNk",
//   //     authDomain: "esp32test-1a774.firebaseapp.com",
//   //     databaseURL: "https://esp32test-1a774-default-rtdb.firebaseio.com",
//   //     projectId: "esp32test-1a774",
//   //     storageBucket: "esp32test-1a774.appspot.com",
//   //     messagingSenderId: "229360093536",
//   //     appId: "1:229360093536:web:8bd992d9924a00fc87b605",
//   //     measurementId: "G-0Q8M78Z55E",
//   //   };
//   const app = initializeApp(firebaseConfig);
//   return getDatabase(app);
// }

// export default StarFirebase;

import { initializeApp } from "firebase/app";
import { getDatabase } from "firebase/database";
//const firebaseConfig = {
 // apiKey: "AIzaSyC3DgDkwbuDRj55X6E08-i9qZGElh28n6M",
 // authDomain: "esp32-test-67f41.firebaseapp.com",
 // databaseURL: "https://esp32-test-67f41-default-rtdb.firebaseio.com",
 // projectId: "esp32-test-67f41",
 // storageBucket: "esp32-test-67f41.appspot.com",
 // messagingSenderId: "919488453332",
 // appId: "1:919488453332:web:c83fd4349097cbaeb53941",
 // measurementId: "G-EM7ZX5VQEF",
//};
const firebaseConfig = {
  apiKey: "AIzaSyApPukPTUloJJpNMR8mkPHmB-L7Rxjm0oI",
  authDomain: "fir-etc-b3fca.firebaseapp.com",
  databaseURL: "https://fir-etc-b3fca-default-rtdb.firebaseio.com",
  projectId: "fir-etc-b3fca",
  storageBucket: "fir-etc-b3fca.appspot.com",
  messagingSenderId: "477511621771",
  appId: "1:477511621771:web:3a1e96803bbc87464c088e",
  measurementId: "G-Z0FDQ7JZVG"
};

const app = initializeApp(firebaseConfig);
const realtimeDB = getDatabase(app);

export default realtimeDB;
