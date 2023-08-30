const { DataTypes } = require("sequelize")

module.exports = (sequelize, Sequelize) => {

    const Refferal = sequelize.define("refferal", {

        sponsor_username: {
            type: DataTypes.STRING,
            allowNull: false
        },

        sponsor_fullname: {
            type: DataTypes.STRING,
            allowNull: false
        }

    }, {
        define: {
            freezeTableName: true
        }
    })

    return Refferal

}