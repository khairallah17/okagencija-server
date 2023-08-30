const { DataTypes } = require("sequelize")

module.exports = (sequelize, Sequelize) => {

    const Deposit = sequelize.define("Deposit", {

        deposit_name: {
            type: DataTypes.STRING,
            allowNull: false,
        },

        deposit_amount: {
            type: DataTypes.FLOAT,
            allowNull: false,
        },

        deposit_date : {
            type: DataTypes.STRING,
            allowNull: false
        },

        deposit_money_transfer_type: {
            type: DataTypes.STRING,
            isIn: [["cryptocurrencie","bank transfer", "credit card"]],
            defaultValue: "credit card"
        },

        deposit_money_currencie: {
            type: DataTypes.STRING,
            isIn: [["dollars","USDT","Bitcoin","ethereum"]],
            defaultValue: "dollars"
        },

        deposit_status: {
            type: DataTypes.BOOLEAN,
            defaultValue: false,
            allowNull: false
        },

        deposit_client_wallet: {
            type: DataTypes.STRING,
            defaultVale: null 
        }

    },{
        define: {
            freezeTableName: true
        }
    })

    return Deposit

}