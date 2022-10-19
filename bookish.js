import express from 'express'
import sql from 'mssql';

const app = express()
const port = 3000
const host = 'localhost'


app.listen(port, host, () => {
  console.log(`Example app listening on port ${port}, ${host}`)
})

const sqlConfig = {
  database: 'Libary management API',
  server: 'localhost',
  user:'sa',
  password:'test',
  // pool: {
  //   max: 10,
  //   min: 0,
  //   idleTimeoutMillis: 30000
  // },
  options: {
    encrypt: false, 
    trustServerCertificate: true // change to true for local dev / self-signed certs
  }
}
async function b(){
 try {
  // make sure that any items are correctly URL encoded in the connection string
  await sql.connect(sqlConfig)
  
  const result = await sql.query(`select * from Book`)
  console.log('fog')
  console.dir(result)
  app.get('/', (req, res) => {
  res.send(result.recordsets[0])
})

 } catch(err){console.log(err.message)}
}

b()

