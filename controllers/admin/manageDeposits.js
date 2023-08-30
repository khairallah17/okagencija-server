const Deposit = require("../../models/index").deposit
const DepositPackages = require("../../models/index").depositPackages

const updateDepositStatus = async (req, res) => {

    const { depositId } = req.params

    try {

        await Deposit.update(
            {
                deposit_status: true
            },
            {
                where: {
                    id: depositId
                }
            }
        )

            return res.status(200).json({message: "deposit approved"})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const getDepositPackages = async (req, res) => {

    try {
        
        const packages = await DepositPackages.findAll()

        return res.status(200).json({packages})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const addDepositPackage = async (req, res) => {

    const { name, value } = req.body

    try {

        await DepositPackages.create({
            deposit_name: name,
            deposit_value: value
        })

        return res.status(200).json({message: "package added successfully"})

    } catch (err) {
        return res.status(500).json({message: err.message || 'an error has been occured'})
    }

}

const deleteDepositPackage = async (req, res) => {

    const { id } = req.headers

    try{

        await DepositPackages.destroy({
            where: {
                id: id
            }
        })

        return res.status(200).json({message: "package deleted successfully"})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const updateDepositPackage = async (req, res) => {

    const { packId } = req.params
    const { packageName, packageValue } = req.body

    console.log(req.params)

    try {

        await DepositPackages.update({
            deposit_name: packageName,
            deposit_valuep: packageValue
        }, {
            where : {
                id: packId
            }
        })

        return res.status(200).json({message: "deposit package updated successfully"})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const deleteDepositById = async (req, res) => {
    
    const { depositId } = req.params

    if (!depositId)
        return res.status(400).json({message: "empty fields required"})

    try{

        await Deposit.destroy({
            where: {
                id: depositId
            }
        })
        
        return res.status(200).json({message: "deposit deleted successfully"})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

module.exports = {
    updateDepositStatus,
    getDepositPackages,
    addDepositPackage,
    deleteDepositPackage,
    updateDepositPackage,
    deleteDepositById
}