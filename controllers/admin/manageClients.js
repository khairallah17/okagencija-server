const User = require("../../models/index").user
const Portfolio = require("../../models/index").portfolio
const Report = require("../../models/index").report
const Profit = require("../../models/index").profit

const getUsers = async (req, res) => {

    try{

        const users = await User.findAll({
            where: {
                isAdmin: false
            },
            include: [Profit, Portfolio, Report]
        })

        return res.status(200).json({users})

    } catch(err) {
        return res.status(500).json({message: err.messsage || "an error has been occured"})
    }

}

const getAllUserDataById = async (req, res) => {

    const { clientId } = req.body

    console.log(req.body)

    if (!clientId)
        return res.status(400).json({message: "empty fields are required"})

    try {

        const userData = await User.findAll({
            where: {
                id: clientId
            },
            include: [Portfolio, Report, Profit]
        })
        
        return res.status(200).json({userData})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const getUserInfoById = async (req, res) => {

    const {userId} = req.params

    try {
        
        const userInfo = await User.findAll({
            where: {
                id: userId
            },
            include: [Profit, Report, Portfolio]
        })

        res.status(200).json({userInfo})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const updateClientInfoById = async (req, res) => {

    const {id, username, password, email} = req.body

    try {

        await User.update({
            email: email,
            username: username,
            password: password
        },{
            where: {
                id: id
            }
        })

        return res.status(200).json({message: "user updated"})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const addNewUser = async (req, res) => {

    const { username, email, password, comission, revenueShare } = req.body

    if (!username || !email || !password || !comission || !revenueShare)
        return res.status(400).json({message: "empty fields required"})

    try {
        
        await User.create({
            email: email,
            username: username,
            password: password,
            comission_earned: comission,
            revenue_share: revenueShare
        })

        return res.status(200).json({message: "user created successfully"})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const deleteClientById = async (req, res) => {

    const { clientid } = req.headers

    try {
        
        await User.destroy({
            where: {
                id: clientid
            }
        })

        return res.status(200).json({message: "User has been deleted successfully"})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

module.exports = {
    getUsers,
    getUserInfoById,
    updateClientInfoById,
    getAllUserDataById,
    addNewUser,
    deleteClientById
}