const { DataTypes } = require("sequelize")

module.exports = (sequelize, Sequelize) => {

    const Payout = sequelize.define("Payout", {

        payout_detail: {
            type: DataTypes.STRING,
            allowNull: false
        },

        payout_value: {
            type: DataTypes.FLOAT,
            allowNull: false
        },

        payout_date: {
            type: DataTypes.STRING,
            allowNull: false
        }, 

        payout_status: {
            type: DataTypes.BOOLEAN,
            defaultValue: false,
            allowNull: false
        }

    })

    return Payout

}