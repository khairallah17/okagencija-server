const { DataTypes } = require("sequelize")

module.exports = (sequelize, Sequelize) => {

    const DepositPackage = sequelize.define("deposit_package", {
        
        deposit_name: {
            type: DataTypes.STRING,
            allowNull: false
        },

        deposit_value: {
            type: DataTypes.FLOAT,
            allowNull: false,
            defaultValue: 0
        }

    })

    return DepositPackage

}