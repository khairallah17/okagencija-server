const express = require("express")
const router = express.Router()
const passport = require("../controllers/auth/passport")
const { loginClient } = require("../controllers/clients/clientsController")
const { addRefferal, getRefferalsByUser, getAllRefferals, removeRefferalById, updateRefferalInfoById } = require("../controllers/clients/manageRefferals")
const { addDeposit, getDepositsByUser, getDepositSumByUser } = require("../controllers/clients/manageDeposits")
const { getAllPayouts, addPayout, getPayoutsByUser, getPayoutSumByUser} = require("../controllers/clients/managePayouts")

// LOGIN AND REGISTER ROUTE FOR EACH CLIENT
router.post("/login", passport.authenticate("jwt", { session: false }) ,loginClient)

// MANAGE REFFERALS ROUTE FOR EACH CLIENT
router.route("/refferals", passport.authenticate("jwt", { session: false }))
        .post(addRefferal)
        .get(getRefferalsByUser)
        .delete(removeRefferalById)
        .patch(updateRefferalInfoById)

// MANAGE DEPOSITS ROUTE FOR EACH CLIENT
router.route("/deposits", passport.authenticate("jwt", { session: false }))
        .post(addDeposit)
        .get(getDepositsByUser)

// GET DEPOSITS SUM FOR EACH USER
router.route("/deposits/sum", passport.authenticate("jwt", { session: false }))
        .get(getDepositSumByUser)

// GET PAYOUTS BY USER
router.route("/payouts/:id", passport.authenticate("jwt", { session: false }))
        .get(getPayoutsByUser)
        
// MANAGE PAYOUTS ROUTES FOR EACH CLIENT
router.route("/payouts", passport.authenticate("jwt", { session: false }))
        .get(getAllPayouts)
        .post(addPayout)


// GET PAYOUT SUM BY USER
router.route("/payouts/sum", passport.authenticate("jwt", { session: false }))
        .get(getPayoutSumByUser)

module.exports = router