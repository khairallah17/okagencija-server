const Payout = require("../../models/index").payout

const updatePayoutStatus = async (req, res) => {

    const {payoutId} = req.params

    try {
        
        await Payout.update(
            {
                payout_status: true
            },
            {
                where: {
                    id: payoutId
                }
            }
        )

        return res.status(200).json({message: "status updated successfully"})

    } catch (err) {
        
        return res.status(500).json({message: err.message || "an error has been occured"})

    }

}

module.exports = {
    updatePayoutStatus
}