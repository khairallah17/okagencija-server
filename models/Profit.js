const { DataTypes } = require("sequelize")

module.exports = (sequelize, Sequelize) => {

    const Profit = sequelize.define("Profit", {
        
        capital: {
            type: DataTypes.INTEGER,
            allowNull: false
        },

        profit: {
            type: DataTypes.INTEGER,
            allowNull: false
        },

        month: {
            type: DataTypes.STRING,
            allowNull: false
        },

        year: {
            type: DataTypes.STRING,
            allowNull: false
        }

    })

    return Profit

}