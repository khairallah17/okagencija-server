const express = require("express")
const router = express.Router()
const { getUsers, getUserInfoById, updateClientInfoById, getAllUserDataById, addNewUser, deleteClientById } = require("../controllers/admin/manageClients")
const { updateDepositStatus, deleteDepositById, getDepositPackages, addDepositPackage, deleteDepositPackage, updateDepositPackage } = require("../controllers/admin/manageDeposits")
const { updatePayoutStatus } = require("../controllers/admin/managePayouts")
const { getAllDeposits, getDepositById } = require("../controllers/clients/manageDeposits")
const { addNews, getNews, deletNewsById } = require("../controllers/admin/manageNews")
const { uploadReport, getAllreports, getReportsById, editPortfolio, portfolioDetails, deleteSignlePortfolio, getAllPortfolios, deleteReportById } = require("../controllers/admin/managePortfolios")
const uploadFile = require("../middlewares/upload")
const passport = require("../controllers/auth/passport")
const { getSingleFile, uploadSingleFile, getAllFiles } = require("../controllers/admin/manageFile")

router.route("/deposits", passport.authenticate("jwt"), { session: false })
        .get(getAllDeposits)
        
router.route("/deposit", passport.authenticate("jwt", { session: false }))
        .get(getDepositById)

// DELETE DEPOSIT PER USER
router.route("/deposit/:depositId", passport.authenticate("jwt", { session: false }))
        .delete(deleteDepositById)

// UPDATE DEPOSIT STATUS
router.route("/deposits/update/:depositId", passport.authenticate("jwt"), { session: false })
        .post(updateDepositStatus)

// GET DEPOSIT PACKAGES
router.route("/deposits/packages", passport.authenticate("jwt"), { session: false })
        .get(getDepositPackages)
        .post(addDepositPackage)
        .delete(deleteDepositPackage)

// UPDATE DEPOSIT PACKAGE
router.route("/deposits/packages/:packId")
        .post(updateDepositPackage)

// GET USERS DETAILS INCLUDING REPORTS AND PORTFOLIO
router.route("/users/info")
        .post(getAllUserDataById)

router.route("/users", passport.authenticate("jwt"), { session: false })
        .get(getUsers)
        .patch(updateClientInfoById)
        .post(addNewUser)
        .delete(deleteClientById)

router.route("/users/:userId", passport.authenticate("jwt"), { session: false })
        .get(getUserInfoById)

// UPDATE PAYOUT STATUS
router.route("/payouts/update/:payoutId", passport.authenticate("jwt"), { session: false })
        .post(updatePayoutStatus)

// MANAGER NEWS ADD GET AND MODIFIE THEM
router.route("/news", passport.authenticate("jwt"), {session: false})
        .get(getNews)
        .post(uploadFile.single("newsImage"), addNews)
        .delete(deletNewsById)

// MANAGE REPORTS ADD AND GET
router.route("/portfolio/reports", passport.authenticate("jwt"), {session: false})
        .post(uploadFile.single("reportFile"), uploadReport)
        .get(getReportsById)

// GET ALL REPORTS
router.route("/reports")
        .get(getAllreports)
        .delete(deleteReportById)

// MANAGE BALANCE AND PROFITE AND GET INFORMATION
router.route("/portfolio")
        .get(getAllPortfolios)
        .post(editPortfolio)

// DELETE PORTFOLIO "RESET ALL TO 0"
router.route("/portfolio/:userId")
        .delete(deleteSignlePortfolio)

// GET ALL THE PORTFOLIO DETAILS PER USER
router.route("/portfolio/details")
        .get(portfolioDetails)

// MANAGE UPLOADED FILES 
router.route("/files")
        .get(getSingleFile)
        .post(uploadFile.single("toolsFile"), uploadSingleFile)

router.route("/files/all")
        .get(getAllFiles)


module.exports = router