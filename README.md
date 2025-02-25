# PostgreSQL & Sequelize Backend

> Advanced relational database implementation using PostgreSQL and Sequelize ORM - built for the Full Stack Open [Part 13](https://fullstackopen.com/en/part13)

## 🚀 Project Highlights

This project demonstrates a production-ready relational database implementation featuring:

- **Advanced SQL Pattern Implementation**: Leveraging PostgreSQL's powerful features beyond basic CRUD operations
- **Migration Management System**: Handling database structure changes without data loss
- **Multi-Table Associations**: Many-to-many relationships with optimized queries
- **Authentication & Authorization**: Role-based access control system with JWT
- **Data Validation & Sanitization**: Sequelize model constraints and custom validators
- **Transaction Management**: Ensuring data integrity across multiple operations

## 🛠️ Technical Architecture

The application follows a modular, layered architecture:

```
/
├── migrations/        # Database structure changes
├── models/            # Sequelize model definitions
├── controllers/       # API route handlers
├── utils/             # Reusable utilities and middleware
├── services/          # Business logic layer
├── cli/               # Command-line management tools
├── tests/             # Integration and unit tests
└── index.js           # Application entry point
```

## 📊 Database Schema

```mermaid
erDiagram
    BLOG {
        int id PK
        string title
        string author
        text url
        timestamp createdAt
        timestamp updatedAt
    }

    USER {
        int id PK
        string username UK
        string name
        boolean admin
        boolean disabled
        timestamp createdAt
        timestamp updatedAt
    }

    READING_LIST {
        int id PK
        int blogId FK
        int userId FK
        boolean read
        timestamp createdAt
        timestamp updatedAt
    }

    SESSION {
        int id PK
        string token
        int userId FK
        timestamp createdAt
        timestamp updatedAt
    }

    USER ||--o{ BLOG : creates
    USER ||--o{ READING_LIST : has
    BLOG ||--o{ READING_LIST : included_in
    USER ||--o{ SESSION : maintains
```

## 🔥 Key Features

- **Complete REST API**: Comprehensive endpoints for all resources
- **Efficient Query Optimization**: Includes pagination, filtering, and eager loading
- **Session Management**: Token invalidation and refresh logic
- **Database Indexing**: Strategic indexes for performance optimization
- **Error Handling**: Consistent error responses with appropriate status codes
- **CLI Tools**: Database management utilities for common operations

## 💻 Installation & Setup

1. **Clone the repository**

   ```bash
   git clone https://github.com/rikulauttia/postgres-sequelize-backend.git
   cd postgres-sequelize-backend
   ```

2. **Install dependencies**

   ```bash
   npm install
   ```

3. **Database setup**

   ```bash
   # Create PostgreSQL database
   createdb blog_app

   # Run migrations
   npm run migrate:up

   # Optional: Seed test data
   npm run seed
   ```

4. **Configure environment variables**
   Create a `.env` file with the following variables:

   ```
   DATABASE_URL=postgres://username:password@localhost:5432/blog_app
   SECRET=your_jwt_secret_key
   PORT=3001
   NODE_ENV=development
   ```

5. **Start the server**
   ```bash
   npm run dev
   ```

## 🧪 API Endpoints

| Method | Endpoint                | Description                   | Auth Required |
| ------ | ----------------------- | ----------------------------- | ------------- |
| GET    | `/api/blogs`            | List all blogs                | No            |
| POST   | `/api/blogs`            | Create a new blog             | Yes           |
| GET    | `/api/blogs/:id`        | Get blog by ID                | No            |
| PUT    | `/api/blogs/:id`        | Update a blog                 | Yes           |
| DELETE | `/api/blogs/:id`        | Delete a blog                 | Yes           |
| GET    | `/api/users`            | List all users                | No            |
| GET    | `/api/users/:id`        | Get user by ID                | No            |
| POST   | `/api/users`            | Create a new user             | No            |
| PUT    | `/api/users/:username`  | Update a user                 | Yes           |
| POST   | `/api/login`            | Authenticate user             | No            |
| DELETE | `/api/logout`           | Invalidate token              | Yes           |
| GET    | `/api/authors`          | Get blog statistics by author | No            |
| POST   | `/api/readinglists`     | Add blog to reading list      | Yes           |
| PUT    | `/api/readinglists/:id` | Mark blog as read             | Yes           |

## 🧪 Testing

```bash
# Run all tests
npm test

# Run specific test suite
npm test -- -t "blog api"
```

## 🚀 Deployment

The application is designed for easy deployment to platforms like Heroku or Render:

```bash
# For Heroku
heroku create
heroku addons:create heroku-postgresql:hobby-dev
git push heroku main
heroku run npm run migrate:up
```

## 📈 Performance Considerations

- Connection pooling is configured for production environments
- Prepared statements are used for frequent queries
- Database indexes are strategically placed on frequently queried fields
- N+1 query problems are avoided with eager loading

## 🔒 Security Features

- Password hashing with bcrypt
- SQL injection protection via parameterized queries
- CORS configuration for API access control
- Rate limiting for public endpoints

## 📚 Learning & Design Decisions

This project was built to demonstrate proficiency with PostgreSQL and Sequelize in a production-ready implementation. Key learning objectives include:

- Proper model association techniques
- Transaction management for data integrity
- Migration strategies for schema evolution
- Efficient query optimization

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.
