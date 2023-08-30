const db = require("../../models/index")
const Portfolio = require("../../models/index").portfolio
const Report = require("../../models/index").report

const signUp = async (req, res) => {

    const { username, email, password } = req.body


    if (!username || !email || !password)
        return res.status(400).json({message: "empty fields required"})

    const User = db.user

    const userDup = User.findOne({
        where: {
            username: username
        }
    })

    if (userDup.username)
        return res.status(500).json({message: "user already exists"})

    try {

        const newUser = await User.create({
            username,
            email,
            password,
            isAdmin: req.body?.isAdmin
        })

        return res.status(200).json({message: "user has been created successfully"})

    } catch (err) {
        return res.status(500).json({message: err.message || "error has been occured" })
    }

}

module.exports = {
    signUp
}