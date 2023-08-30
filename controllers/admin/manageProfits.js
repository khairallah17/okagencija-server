const Profit = require("../../models/index").profit

const getProfitsByUser = async (req, res) => {

    const { portfolioId } = req.params

    if (!portfolioId)
        return res.status(400).json({message: "empty fields required"})

    try {

        const profits = await Profit.findAll({
            where: {
                portfolioId: portfolioId
            }
        })

        return res.status(200).json({profits})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const getAllProfits = async (req, res) => {

    try {

        const profits = await Profit.findAll()

        return res.status(200).json({profits})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const addProfitByUser = async (req, res) => {

    const { capital, profit, month, portfolioId } = req.body

    if (!capital || !profit || !month)
        return res.status(400).json({message: "empty fields are required"})

    try {

        await Profit.upsert({
            capital: capital,
            profit: profit,
            month: month,
            PortfolioId: portfolioId
        }, 
        {
            where: {
                month: month,
                PortfolioId: portfolioId
            }
        })

        return res.status(200).json({message: "profit added successfully"})

    } catch(err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

module.exports = {
    getProfitsByUser,
    getAllProfits,
    addProfitByUser
}