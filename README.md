# LIBRARY MANAGEMENT SYSTEM

## 1. Introduction

The Library Management System is a web-based application developed to simplify and improve library management operations. It provides a centralized platform for managing books, users, borrowing and returning transactions, and available book stock.

The system was developed using React, Node.js, Express.js and MySQL.

## 2. Project Objectives

The main objectives of this project are to:

- Simplify library book management.
- Maintain accurate book stock records.
- Record book borrowing and returns.
- Manage registered library users.
- Provide a dashboard showing library statistics.
- Improve the security of user accounts and system access.

## 3. Technologies Used

**Frontend**
- React 19
- JavaScript
- React Router DOM
- CSS
- Vite

**Backend**
- Node.js
- Express.js
- MySQL2
- REST API
- Fetch API

**Security**
- JSON Web Token (JWT)
- bcryptjs
- dotenv

**Database**
- MySQL

## 4. System Features

### Dashboard
- Displays total book titles.
- Displays available book copies.
- Shows registered users.
- Shows recorded transactions.
- Highlights books with fewer than two available copies.

### Book Management
- Add new books.
- View book records.
- Update book information.
- Delete books.
- Monitor available quantities.

### Transaction Management
- Record borrowing transactions.
- Record returned books.
- Add additional book stock.
- Update and delete transaction records.
- Automatically adjust book quantities.
- Maintain transaction history.

### User Management
- Register new users.
- View registered users.
- Update user information.
- Delete users.
- Assign user roles.

### Authentication
- Login using membership ID and password.
- Password hashing using bcryptjs.
- JWT-based authentication.
- Protected backend API routes.

## 5. Project Structure

```text
Library-Management-System/
│
├── backend/
│   ├── middleware/
│   │   └── auth.js
│   ├── routes/
│   │   ├── books.js
│   │   ├── transactions.js
│   │   └── users.js
│   ├── db.js
│   ├── server.js
│   └── package.json
│
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── App.jsx
│   │   ├── App.css
│   │   └── api.js
│   ├── package.json
│   └── index.html
│
└── .gitignore
```

## 6. Requirements

To run the application, you need:

- Node.js and npm.
- MySQL Server.
- Visual Studio Code or another code editor.
- A web browser.

## 7. Database Configuration

The application uses a MySQL database named `librarydb`.

The database contains the following main tables:

- `books` – stores book information and quantities.
- `users` – stores registered user information and password hashes.
- `transactions` – stores borrowing, returning and stock transaction records.

The complete SQL structure and seed data is provided in `schema.sql` (and `backend/schema.sql`).
You can set up the database automatically by running:

```powershell
cd backend
npm run setup-db
```

Or you can import `schema.sql` directly using MySQL Workbench or the MySQL command line client.

## 8. Backend Installation

1. Open the project folder in Visual Studio Code.
2. Open a terminal.
3. Navigate to the backend folder:

```powershell
cd backend
```

4. Install the dependencies:

```powershell
npm install
```

5. Create a `.env` file inside the backend folder.

6. Configure your database connection and JWT secret:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=YOUR_MYSQL_PASSWORD
DB_NAME=LibraryDB
JWT_SECRET=YOUR_PRIVATE_SECRET
PORT=5000
```

Replace the example values with your own configuration.

7. Start the backend:

```powershell
npm run dev
```

The backend runs at:

`http://localhost:5000`

## 9. Frontend Installation

1. Open a second terminal.
2. Navigate to the frontend folder:

```powershell
cd frontend
```

3. Install the dependencies:

```powershell
npm install
```

4. Start the frontend:

```powershell
npm run dev
```

Open the local address displayed by Vite in your browser. Normally, this is:

`http://localhost:5173`

## 10. Login Instructions

1. Open the application in your browser.
2. Navigate to the Login page.
3. Enter a registered membership ID.
4. Enter the corresponding password.
5. Click Login.

A registered user account is required to access the system. The following default accounts are seeded:

| Role | Membership ID | Password | Name |
|---|---|---|---|
| Admin | `LIB001` | `admin1234` | Bolepo Tankisang |
| Librarian | `LIB002` | `admin1234` | Monyooe Moalosi |
| Member | `MEM001` | `admin1234` | Moeketsi Ratopa |
| Admin | `ADMIN001` | `MONYOOE666NYOKS777` | System Admin |

## 11. API Endpoints

| Method | Endpoint | Purpose |
|---|---|---|
| GET | `/api/books` | View books |
| POST | `/api/books` | Add books |
| PUT | `/api/books/:id` | Update books |
| DELETE | `/api/books/:id` | Delete books |
| GET | `/api/users` | View users |
| POST | `/api/users` | Register users |
| POST | `/api/users/login` | User login |
| PUT | `/api/users/:id` | Update users |
| DELETE | `/api/users/:id` | Delete users |
| GET | `/api/transactions` | View transactions |
| POST | `/api/transactions` | Record transactions |
| PUT | `/api/transactions/:id` | Update transactions |
| DELETE | `/api/transactions/:id` | Delete transactions |

Protected endpoints require a valid JWT token.

## 12. Running the Complete Application

The frontend and backend must run in separate terminals.

**Terminal 1 – Backend**

```powershell
cd backend
npm run dev
```

**Terminal 2 – Frontend**

```powershell
cd frontend
npm run dev
```

## 13. Testing

The following functions can be tested:

- User login and logout.
- Adding, updating and deleting books.
- Book availability and low-stock highlighting.
- Borrowing and returning books.
- Adding additional stock.
- Updating and deleting transactions.
- Adding, updating and deleting users.
- Accessing protected API routes.

## 14. GitHub Repository

**Project Name:** Library Management System

**Repository:**  
https://github.com/Monyooe/Library-Management-System

## 15. Conclusion

The Library Management System demonstrates the development of a full-stack web application using modern web technologies. It combines frontend development, backend programming, database management, REST API integration and authentication to provide an organized solution for library operations.