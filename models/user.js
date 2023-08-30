const { DataTypes } = require("sequelize")
const Portfolio = require("./index").portfolio
const Report = require("./index").report

module.exports = (sequelize, Sequelize) => {

    const User = sequelize.define('user', {

        username : {
            type: DataTypes.STRING,
            allowNull: false,
            unique: true
        },

        email : {
            type: DataTypes.STRING,
            allowNull: false,
            unique: true
        },

        password : {
            type: DataTypes.STRING,
            allowNull: false
        },

        revenue_share: {
            type: DataTypes.STRING,
            defaultValue: null
        },

        comission_earned: {
            type: DataTypes.INTEGER,
            defaultValue: 0
        },

        isAdmin : {
            type: DataTypes.BOOLEAN,
            defaultValue: false,
        }

    },{
        define: {
            freezeTableName: true
        }
    })

    return User

}