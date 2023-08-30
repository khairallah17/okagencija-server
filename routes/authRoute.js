const express = require("express")
const router = express.Router()

const { signUp } = require("../controllers/auth/register")
const { login } = require("../controllers/auth/login")

router.post("/signup", signUp)
router.post("/login", login)

module.exports = router