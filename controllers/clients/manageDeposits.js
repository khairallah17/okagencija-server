const Deposit = require("../../models/index").deposit
const User = require("../../models/index").user

const addDeposit = async (req, res) => {

    const { depositName,
            depositAmount,
            clientId,
            depositDate } = req.body

    const depositWallet = req.body?.depositWallet
    const depositMoneyTransferType = req.body?.depositMoneyTransferType
    const depositMoneyCurrencie = req.body?.depositMoneyCurrencie 

    if (!depositAmount || !depositName|| !clientId || !depositDate)
        return res.status(400).json({message: "empty fields are required"})

    try {
        
        await Deposit.create({
            deposit_name: depositName,
            deposit_amount: depositAmount,
            deposit_money_transfer_type: depositMoneyTransferType,
            deposit_money_currencie: depositMoneyCurrencie,
            client_id: clientId,
            deposit_client_wallet: depositWallet,
            deposit_date: depositDate
        })

        res.status(200).json({message: "deposit added successfully"})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const getDepositsByUser = async (req, res) => {

    const { clientid } = req.query

    if (!clientid)
        return res.status(400).json({message: "empty fields are required"})

    try {
        
        const deposits = await Deposit.findAll({
            where: {
                client_id: clientid
            }
        })

        return res.status(200).json({deposits})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const getAllDeposits = async (req, res) => {

    try {
        
        const depositData = await Deposit.findAll({
            limit: 5,
            include: User
        })

        return res.status(200).json({depositData})

    } catch (error) {
        return res.status(500).json({message: error.message || "an error has been occured"})
    }

}

const getDepositById = async (req, res) => {

    const { id } = req.query

    try {
        
        const deposit = await Deposit.findByPk(id, {})

        return res.status(200).json({deposit})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const getDepositSumByUser = async (req, res) => {

    const {clientid} = req.query

    if (!clientid)
        return res.status(400).json({message: "clientid is required"})

    try {

        const depositSum = await Deposit.sum('deposit_amount', {
            where:{
                client_id: clientid
            }
        })

        return res.status(200).json({depositSum})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

module.exports = {
    addDeposit,
    getDepositsByUser,
    getAllDeposits,
    getDepositById,
    getDepositSumByUser
}

