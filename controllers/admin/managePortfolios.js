const Portfolio = require("../../models/index").portfolio
const Report = require("../../models/index").report
const User = require("../../models/index").user
const Profit = require("../../models/index").profit

const editPortfolio = async (req, res) => {

    const { profit, capital, startBalance, currentBalance, clientId, month, year } = req.body

    if (!clientId || !startBalance || !currentBalance)
        return res.status(400).json({message: "empty fields required!"})
    
        try {

            if (profit && capital && month && year)
            {
                await Profit.create({
                    capital: capital,
                    profit: profit,
                    month: month,
                    year: year,
                    userId: clientId
                })
            }
        
            await Portfolio.update(
                {
                    portfolio_profit: profit,
                    portfolio_capital: capital,
                    portfolio_start_balance: startBalance,
                    portfolio_current_balance: currentBalance,
                    userId: clientId 
                },
                {
                    where: {
                        userId: clientId
                    }
                }
            )


        return res.status(200).json({message: "portfolio updated successfully!!"})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const uploadReport = async (req, res) => {

    const { reportName, clientId } = req.body
    const reportFilePath = req.file.path


    if (!reportName || !reportFilePath || !clientId )
        return res.status(400).json({message: "empty fields are required"})


    try {

        const [report, createdReport] = await Report.create({
            report_name: reportName,
            report_file: reportFilePath.slice(reportFilePath.indexOf("/public")),
            userId: clientId,
        })

        return res.status(200).json({message: "report uploaded successfully"})

    } catch(err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const portfolioDetails = async (req, res) => {

    try {

        const reports = await Report.findAll({
            include: {
                model: Portfolio,
                required: true
            }
        })

        return res.status(200).json({reports})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const getReportsById = async (req, res) => {

    const { id } = req.headers

    if (!id)
        return res.status(400).json({message: "empty fields are required"})

    try {
        
        const reports = await Report.findAll({
            where: {
                userId: id
            }
        })

        return res.status(200).json({reports})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const getPortfolioDetailsById = async (req, res) => {

    const { id } = req.headers

    if (!id)
        return res.status(200).json({message: "empty fields are missing"})

    try {

        const portfolio = await Portfolio.findAll({
            where: {
                userId: id
            },
            include: Profit
        })

        return res.status(200).json({portfolio})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const getAllPortfolios = async (req, res) => {

    try {

        const portfolios = await Portfolio.findAll({
            include: User
        })

        return res.status(200).json({portfolios})

    } catch (err) {
        return res.stauts(500).json({message: err.message || "an error has been occured"})
    }

}

const getAllreports = async (req, res) => {

    try {
        
        const reports = await Report.findAll({
            include: User
        })

        return res.status(200).json({reports})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const deleteReportById = async (req, res) => {

    const { reportid } = req.headers

    console.log(reportid)

    try {
        
        await Report.destroy({
            where: {
                id: reportid
            }
        })

        return res.status(200).json({message: "report has been deleted"})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const deleteSignlePortfolio = async (req, res) => {

    const { userId } = req.params

    try {
        
        await Portfolio.update({
            portfolio_capital: 0,
            portfolio_profit: 0,
            portfolio_start_balance: 0,
            portfolio_current_balance: 0,
            
        },{
            where: {
                userId: userId
            }
        })

        await Profit.destroy({
            where: {
                userId: userId
            }
        })

        return res.status(200).message({message: "portfolio Deleted"})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

module.exports = {
    editPortfolio,
    uploadReport,
    getReportsById,
    getPortfolioDetailsById,
    portfolioDetails,
    getAllPortfolios,
    getAllreports,
    deleteReportById,
    deleteSignlePortfolio
}