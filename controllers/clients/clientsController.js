

const loginClient = async (req, res) => {
    
    const {username ,password} = req.body

    if (!username || !password)
        return res.status(400).json({message: "empty fields required"})

}

const registerClient = async () => {

    const { username, email, password } = req.body

}

module.exports = {
    loginClient
}