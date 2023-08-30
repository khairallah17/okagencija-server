const { DataTypes } = require("sequelize")

module.exports = (sequelize, Sequelize) => {

    const Report = sequelize.define("Reports", {

        report_name: {
            type: DataTypes.STRING,
            defaultValue: null
        },

        report_file: {
            type: DataTypes.STRING,
            defaultValue: null
        }

    })

    return Report

}