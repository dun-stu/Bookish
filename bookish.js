import express from 'express'
import sql from 'mssql';
import {table} from './tablelate.js'
import jwt from 'jsonwebtoken'

const app = express()
const port = 3000
const host = 'localhost'


app.listen(port, host, () => {
  console.log(`Example app listening on port ${port}, ${host}`)
})

class BookClass{

  constructor(BookObject){
    this.BookID = BookObject.BookID
    this.Title = BookObject.Title
    this.Author = BookObject.Author
    this.ISBN = BookObject.ISBN
  }
}

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
async function b(Query){
 try {
  // make sure that any items are correctly URL encoded in the connection string
  await sql.connect(sqlConfig)
  app.get('/Books', async(req, res) => {
    let result = await sql.query(Query)
    const Books = result.recordsets[0].map(BookObject=>new BookClass(BookObject))
    res.send(Books)
  })

  app.get('/login', async(req, res) => {
    let givenUsername = req.query.username
    let givenPassword = req.query.password
    let result = await sql.query(`select Password from Users where (Username = '${givenUsername}') and (Password = '${givenPassword}')`)
    var token = jwt.sign(); //
    console.log(token)
    const UserRecords = result.recordsets[0]
    res.send(UserRecords)
  })

 } catch(err){res.send(UserRecords)}
}

let Query = `select * from Book`
b(Query)

