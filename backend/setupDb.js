const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');
require('dotenv').config();

async function setupDatabase() {
    console.log('--- Initializing MySQL Database for Library Management System ---');
    console.log(`Connecting to MySQL host: ${process.env.DB_HOST || 'localhost'}, user: ${process.env.DB_USER || 'root'}...`);

    // First connect without selecting a database, so we can ensure the database exists
    let connection;
    try {
        connection = await mysql.createConnection({
            host: process.env.DB_HOST || 'localhost',
            user: process.env.DB_USER || 'root',
            password: process.env.DB_PASSWORD || '',
            multipleStatements: true
        });
        console.log('Connected to MySQL server.');

        const dbName = process.env.DB_NAME || 'librarydb';
        await connection.query(`CREATE DATABASE IF NOT EXISTS \`${dbName}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;`);
        console.log(`Database '${dbName}' verified/created.`);

        await connection.changeUser({ database: dbName });

        const sqlFilePath = path.join(__dirname, 'schema.sql');
        const sql = fs.readFileSync(sqlFilePath, 'utf8');

        console.log('Executing schema.sql...');
        await connection.query(sql);

        // Fetch counts to confirm
        const [[{ userCount }]] = await connection.query('SELECT COUNT(*) AS userCount FROM users');
        const [[{ bookCount }]] = await connection.query('SELECT COUNT(*) AS bookCount FROM books');
        const [[{ transCount }]] = await connection.query('SELECT COUNT(*) AS transCount FROM transactions');

        console.log('\n Database setup successfully completed!');
        console.log(`- Database:     ${dbName}`);
        console.log(`- Users:        ${userCount}`);
        console.log(`- Books:        ${bookCount}`);
        console.log(`- Transactions: ${transCount}`);
        console.log('\nDefault credentials to log in:');
        console.log('  Admin:     Membership ID: LIB001   | Password: admin1234');
        console.log('  Librarian: Membership ID: LIB002   | Password: admin1234');
        console.log('  Member:    Membership ID: MEM001   | Password: admin1234');
        console.log('  Sys Admin: Membership ID: ADMIN001 | Password: MONYOOE666NYOKS777\n');

    } catch (error) {
        console.error('\nDatabase setup failed:', error.message);
        process.exitCode = 1;
    } finally {
        if (connection) {
            await connection.end();
        }
    }
}

setupDatabase();
