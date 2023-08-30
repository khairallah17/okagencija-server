const Payout = require("../../models/index").payout
const User = require("../../models/index").user

const getAllPayouts = async (req, res) => {

    try{

        const payoutData = await Payout.findAll({
            include: User
        })

        return res.status(200).json({payoutData})

    } catch(err) {
        return res.status(500).json({message: err.message || "an error has been accured"})
    }

}

const getPayoutsByUser = async (req, res) => {

    const { id } = req.params

    try {

        const payouts = await Payout.findAll({
            where: {
                client_id: id
            }
        })
        
        return res.status(200).json({payouts})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const addPayout = async (req, res) => {

    const {
        payoutDetail,
        payoutValue,
        payoutDate,
        clientId
    } = req.body

    if (!payoutDetail || !payoutValue || !clientId)
        return res.status(400).json({message: "empty fields are required"})

    try{

        const response = await Payout.create({
            payout_detail: payoutDetail,
            payout_value: payoutValue,
            payout_date: payoutDate,
            client_id: clientId
        })
        
        return res.status(500).json({message: "payout added successfully!"})

    } catch(err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    } 

}

const getPayoutSumByUser = async (req, res) => {

    const {clientid} = req.query

    if (!clientid)
        return res.status(400).json({message: "clientid is required"})

    try {
        
        const payoutSum = await Payout.sum("payout_value", {
            where: {
                client_id: clientid
            }
        })

        return res.status(200).json({payoutSum})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

module.exports = {
    getAllPayouts,
    addPayout,
    getPayoutsByUser,
    getPayoutSumByUser
}