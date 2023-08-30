const { DataTypes } = require("sequelize")

module.exports = (sequelize, Sequelize) => {

    const News = sequelize.define("News", {

        title: {
            type: DataTypes.STRING,
            allowNull: false
        },

        content: {
            type: DataTypes.STRING,
            allowNull: false
        },

        image: {
            type: DataTypes.STRING,
            defaultValue: false
        }

    })

    return News

}