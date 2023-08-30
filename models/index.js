const Sequelize = require("sequelize");
require("dotenv").config()


const sequelize = new Sequelize(process.env.DATABASE_NAME, process.env.MYSQL_USER, process.env.MYSQL_PASSWORD, {
    host: 'localhost',
    dialect: "mysql",


    pool: {
        max: 5,
        min: 0,
        idle: 1000
    }

})

const db = {}

db.Sequelize = Sequelize 
db.sequelize = sequelize
db.deposit = require("./Deposit")(sequelize, Sequelize)
db.news = require("./news")(sequelize, Sequelize)
db.refferal = require("./referral")(sequelize, Sequelize)
db.payout = require("./payout")(sequelize, Sequelize)
db.depositPackages = require("./depositPackages")(sequelize, Sequelize)
db.report = require("./Reports")(sequelize, Sequelize)
db.portfolio = require("./Portfolio")(sequelize, Sequelize)
db.profit = require("./Profit")(sequelize, Sequelize)
db.user = require("./user")(sequelize, Sequelize)
db.tools = require("./Tools")(sequelize, Sequelize)

db.user.hasMany(db.deposit,{
    onDelete: 'CASCADE'
})
db.deposit.belongsTo(db.user, {
    foreignKey: {
        name: "client_id"
    }
})

db.user.hasMany(db.user,{
    onDelete: 'CASCADE'
})
db.refferal.belongsTo(db.user, {
    foreignKey: {
        name: "client_id"
    }
})

db.user.hasMany(db.payout,{
    onDelete: 'CASCADE'
})
db.payout.belongsTo(db.user, {
    foreignKey: {
        name: "client_id"
    }
})

db.user.hasMany(db.report,{
    onDelete: 'CASCADE'
})
db.report.belongsTo(db.user)

db.user.hasOne(db.portfolio,{
    onDelete: 'CASCADE'
})
db.portfolio.belongsTo(db.user)

db.user.hasMany(db.profit,{
    onDelete: 'CASCADE'
})
db.profit.belongsTo(db.user)

db.user.addHook("afterCreate", async (user, options) => {
    try {
        
        await db.portfolio.create({
            portfolio_profit: 0,
            portfolio_capital: 0,
            portfolio_start_balance: 0,
            portfolio_current_balance: 0,
            userId: user.id
        })

    } catch (err) {
        console.log(err.message)
    }
})

module.exports = db