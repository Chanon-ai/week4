const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");
const path = require("path");

const app = express();

app.use(cors());
app.use(express.json());

// MySQL connection
const db = mysql.createConnection({
  host: "localhost", // ถ้า Node.js อยู่เครื่องเดียวกับ MySQL
  user: "root",
  password: "",
  database: "flutter_books_db",
});

db.connect(err => {
  if (err) {
    console.error("Database connection failed:", err);
    return;
  }
  console.log("Connected to MySQL database");
});

// Serve images from /images folder
app.use("/assets/images", express.static(path.join(__dirname, "images")));

// API ดึงหนังสือทั้งหมด
app.get("/books", (req, res) => {
  db.query("SELECT * FROM books", (err, results) => {
    if (err) {
      console.error("Error fetching books:", err);
      res.status(500).send("Error fetching books");
      return;
    }
    res.json(results);
  });
});

// Listen on all network interfaces
app.listen(3000, "0.0.0.0", () => {
  console.log("Server running on http://0.0.0.0:3000");
});
