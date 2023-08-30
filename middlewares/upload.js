const multer = require("multer")
const path = require("path")

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        const parentDir = path.resolve(__dirname, "..")
        cb(null, parentDir + "/public/reports")
    },
    filename: (req, file, cb) => {
        cb(null, `${Date.now()}-${file.originalname}`)
    }
})

const uploadFile = multer({storage: storage})

module.exports = uploadFile