-- Create blogs table
CREATE TABLE blogs (
    id SERIAL PRIMARY KEY,
    author TEXT,
    url TEXT NOT NULL,
    title TEXT NOT NULL,
    likes INTEGER DEFAULT 0
);

-- Insert blog posts
INSERT INTO blogs (author, url, title, likes) 
VALUES ('John Doe', 'https://example.com/first-blog', 'First Blog Post', 10);

INSERT INTO blogs (author, url, title, likes) 
VALUES ('Jane Smith', 'https://example.com/second-blog', 'Second Blog Post', 5);

-- Verify table contents
SELECT * FROM blogs;
