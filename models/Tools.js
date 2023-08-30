const { DataTypes } = require("sequelize")

module.exports = (sequelize, Sequelize) => {

    const Tools = sequelize.define("tools", {

        file: {
            type: DataTypes.STRING,
        },

        type: {
            type: DataTypes.STRING
        }

    })

    return Tools

}