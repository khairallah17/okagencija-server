const Refferal = require("../../models/index").refferal

const addRefferal = async (req, res) => {
    
    const { sponsorUsername, sponsorFullname, clientId } = req.body

    if (!sponsorFullname || !sponsorUsername || !clientId)
        return res.status(400).json({messsage: "empty fields required"})

    try {

        await Refferal.create({
            client_id: clientId,
            sponsor_username: sponsorUsername,
            sponsor_fullname: sponsorFullname
        })

        return res.status(200).json({message: "refferal added !!"})

    } catch(err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const getRefferalsByUser = async (req, res) => {

    const { clientid } = req.query

    if (!clientid)
        return res.status(400).json({message: "empty fields are required"})

    try {
        
        const refferals = await Refferal.findAll({
            where:{
                client_id: clientid
            }
        })

        res.status(200).json({refferals})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const getAllRefferals = async (req, res) => {

    try {

        const refferals = await Refferal.findAll()

        return res.status(200).json({refferals})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const removeRefferalById = async (req, res) => {

    const { refferalid } = req.headers

    if (!refferalid)
        return res.status(400).json({message: "empty fields required"})

    try {

        await Refferal.destroy({
            where: {
                id: refferalid
            }
        })

        return res.status(200).json({message: "refferal deleted successfuly"})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const updateRefferalInfoById = async (req, res) => {

    const { sponsorUsername, sponsorFullname, refferalId} = req.body

    if (!sponsorFullname || !sponsorUsername || !refferalId)
        return res.status(400).json({message: "empty fields required"})

    try {
        
        await Refferal.update({
            sponsor_fullname: sponsorFullname,
            sponsor_username: sponsorUsername,
        },{
            where: {
                id: refferalId
            }
        })

        return res.status(200).json({message: "refferal updated successfully"})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

module.exports = {
    addRefferal,
    getRefferalsByUser,
    getAllRefferals,
    removeRefferalById,
    updateRefferalInfoById
}