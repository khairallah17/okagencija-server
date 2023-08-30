const db = require("../../models/index")
const jwt = require("jsonwebtoken")
const user = require("../../models/user")

const login = async (req, res) => {

    const { username ,password } = req.body

    if (!username || !password)
        return res.status(400).json({message: "empty fields are required"})

    const User = db.user

    try {

        const userFound = await User.findOne({
            where: {
                username: username
            }
        })

        if (userFound.username != username || userFound.password != password)
            return res.status(404).json({message: "Email or password does not match!"})

        const jwtToken = jwt.sign({
            email: userFound.email,
            username: userFound.username,
            isAdmin: userFound.isAdmin,
            clientId: userFound.id
        }, process.env.JWT_SECRET)

        return res.status(200).json({message: 'login succes', token: jwtToken})

        
    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

module.exports = {
    login
}