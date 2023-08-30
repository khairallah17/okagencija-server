const { DataTypes } = require("sequelize")

module.exports = (sequelize, Sequelize) => {

    const Portfolio = sequelize.define("Portfolio", {

        portfolio_profit: {
            type: DataTypes.INTEGER,
            delfaultValue: null
        },

        portfolio_capital: {
            type: DataTypes.INTEGER,
            delfaultValue: null
        },

        portfolio_start_balance: {
            type: DataTypes.INTEGER,
            delfaultValue: null
        },

        portfolio_current_balance: {
            type: DataTypes.INTEGER,
            delfaultValue: null
        }

    }, {
        define: {
            freezeTableName: true
        }
    })

    return Portfolio

}