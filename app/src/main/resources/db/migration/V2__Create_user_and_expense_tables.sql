CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT UNIQUE NOT NULL,
    phone TEXT,
    address TEXT
);
CREATE TABLE IF NOT EXISTS expenses (
    id INTEGER PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    amount DECIMAL,
    currency VARCHAR DEFAULT 'USD',
    date TIMESTAMP,
    category TEXT CHECK (
        category IN (
            'Groceries', 
            'Entertainment', 
            'Utilities', 
            'Transportation', 
            'Healthcare', 
            'Clothing', 
            'Education', 
            'Gifts and Donations', 
            'Home Maintenance', 
            'Insurance', 
            'Taxes', 
            'Travel', 
            'Subscriptions', 
            'Miscellaneous',
            'Rent or Mortgage',
            'Savings'
        )
    )
);
ALTER TABLE logins
ADD COLUMN user_id INTEGER REFERENCES users(id);
