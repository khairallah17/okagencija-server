const Tools = require("../../models/index").tools

const getSingleFile = async (req, res) => {

    const { fileType } = req.headers

    if (!fileType)
        return res.status(400).json({message: "empty fields required"})

    try {
        
        const file = await Tools.findAll({
            where: {
                type: fileType
            }
        })

        return res.status(200).json({file})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const getAllFiles = async (req, res) => {

    try {

        const files = await Tools.findAll()

        return res.status(200).json({files})
        
    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const uploadSingleFile = async (req, res) => {

    const { fileType } = req.body
    const toolsFile = req.file.path

    if (!fileType || !toolsFile)
        return res.status(400).json({message: "empty fields required"})

    try {
        
        await Tools.upsert({
            type: fileType,
            file: toolsFile.slice(toolsFile.indexOf("/public"))
        },{
            where: {
                type: fileType
            }
        })

        return res.status(200).json({message: "file uploaded successfully"})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

module.exports = {
    getSingleFile,
    uploadSingleFile,
    getAllFiles
}