const News = require("../../models/index").news

const addNews = async (req, res) => {

    const { title, content } = req.body
    const newsImagePath = req.file.path

    if (!title || !content || !newsImagePath)
        return res.status(400).json({message: "empty fields are required"})

    try{

        await News.create({
            title,
            content,
            image: newsImagePath.slice(newsImagePath.indexOf("/public"))
        })

        return res.status(200).json({messae: "news added successfully"})

    } catch(err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const getNews = async (req, res) => {

    try {
        
        const news = await News.findAll()

        return res.status(200).json({news})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

const deletNewsById = async (req, res) => {

    const { newsid } = req.headers

    if (!newsid)
        return res.status(400).json({message: "empty fields required"})

    try {
        
        await News.destroy({
            where: {
                id: newsid
            }
        })

        return res.status(200).json({message: "news deleted successfully"})

    } catch (err) {
        return res.status(500).json({message: err.message || "an error has been occured"})
    }

}

module.exports = {
    addNews,
    getNews,
    deletNewsById
}