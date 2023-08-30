const passport = require("passport")
const passportJwt = require("passport-jwt")

const ExtractJwt = passportJwt.ExtractJwt
const StrategyJwt = passportJwt.Strategy 

const User = require("../../models/index").user

passport.use(new StrategyJwt({
        jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
        secretOrKey: process.env.JWT_SECRET
    }, (jwtPayload, done) => {
        return User.findOne({ where: { username: jwtPayload.username }})
                .then(user => done(null, user))
                .catch(err => done(err))
    })
)

module.exports = passport