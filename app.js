require('dotenv').config()
let {name,age,platform} = {
   ...process.env
}
console.log(`userinfo is name: ${name}, age: ${age},platform: ${platform}`)