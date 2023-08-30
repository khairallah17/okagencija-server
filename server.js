const express = require("express")
const cors = require("cors")
const db = require("./models/index")
const {logger} = require("./middlewares/logEvents")

// CLIENTS ROUTE
const clientRoute = require("./routes/clientRoutes")

// AUTH ROUTE
const authRoute = require("./routes/authRoute")

// ADMIN ROUTE
const adminRoute = require("./routes/adminRoutes")

const app = express()

const PORT = process.env.PORT || 3000

const corsOption = {
    origin: "*",
}

app.use(logger);
app.use(express.urlencoded({extended: true}))
app.use(express.json())
app.use('/public', express.static('public'))

app.use(cors(corsOption))

db.sequelize.sync()

app.get("/", (req, res) => {
    res.json({message: "API WORKING"})
})

app.use("/api/v1", authRoute)
app.use("/api/v1/client", clientRoute)
app.use("/api/v1/admin", adminRoute)

app.listen(PORT, () => console.log(`app listening on port :${PORT}`))