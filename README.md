# AirBnB Database Schema

## Overview

This project defines the database schema for an AirBnB-style booking platform. The system supports users (guests, hosts, admins), properties, bookings, payments, reviews, and messages between users.

---

##  Entities and Attributes

### 🧑 User
- `user_id`: UUID, Primary Key
- `first_name`: VARCHAR, NOT NULL
- `last_name`: VARCHAR, NOT NULL
- `email`: VARCHAR, UNIQUE, NOT NULL
- `password_hash`: VARCHAR, NOT NULL
- `phone_number`: VARCHAR, NULL
- `role`: ENUM (`guest`, `host`, `admin`), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT `CURRENT_TIMESTAMP`

---

### 🏠 Property
- `property_id`: UUID, Primary Key
- `host_id`: UUID, Foreign Key → `User(user_id)`
- `name`: VARCHAR, NOT NULL
- `description`: TEXT, NOT NULL
- `location`: VARCHAR, NOT NULL
- `price_per_night`: DECIMAL, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT `CURRENT_TIMESTAMP`
- `updated_at`: TIMESTAMP, DEFAULT `CURRENT_TIMESTAMP`

---

### 📅 Booking
- `booking_id`: UUID, Primary Key
- `property_id`: UUID, Foreign Key → `Property(property_id)`
- `user_id`: UUID, Foreign Key → `User(user_id)`
- `start_date`: DATE, NOT NULL
- `end_date`: DATE, NOT NULL
- `total_price`: DECIMAL, NOT NULL
- `status`: ENUM (`pending`, `confirmed`, `canceled`), NOT NULL
- `created_at`: TIMESTAMP, DEFAULT `CURRENT_TIMESTAMP`

---

### 💳 Payment
- `payment_id`: UUID, Primary Key
- `booking_id`: UUID, Foreign Key → `Booking(booking_id)`
- `amount`: DECIMAL, NOT NULL
- `payment_date`: TIMESTAMP, DEFAULT `CURRENT_TIMESTAMP`
- `payment_method`: ENUM (`credit_card`, `paypal`, `stripe`), NOT NULL

---

### ⭐ Review
- `review_id`: UUID, Primary Key
- `property_id`: UUID, Foreign Key → `Property(property_id)`
- `user_id`: UUID, Foreign Key → `User(user_id)`
- `rating`: INTEGER (1 to 5), NOT NULL
- `comment`: TEXT, NOT NULL
- `created_at`: TIMESTAMP, DEFAULT `CURRENT_TIMESTAMP`

---

### 💬 Message
- `message_id`: UUID, Primary Key
- `sender_id`: UUID, Foreign Key → `User(user_id)`
- `recipient_id`: UUID, Foreign Key → `User(user_id)`
- `message_body`: TEXT, NOT NULL
- `sent_at`: TIMESTAMP, DEFAULT `CURRENT_TIMESTAMP`

---

## 🔐 Constraints and Indexes

### Constraints
- **Users**: Unique constraint on `email`
- **Properties**: `host_id` must reference an existing user with role `host`
- **Bookings**: `status` must be one of `pending`, `confirmed`, `canceled`
- **Payments**: Must be tied to a valid booking
- **Reviews**: Ratings must be between 1 and 5
- **Messages**: Must have valid sender and recipient

### Indexes
- `user_id`, `property_id`, `booking_id`, `payment_id`, `review_id`, and `message_id`: Primary keys (automatically indexed)
- Additional Indexes:
  - `email` in Users
  - `property_id` in Properties and Bookings
  - `booking_id` in Bookings and Payments

---

## 🧱 ENUM Types
```sql
CREATE TYPE user_role AS ENUM ('guest', 'host', 'admin');
CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'canceled');
CREATE TYPE payment_method AS ENUM ('credit_card', 'paypal', 'stripe');
````

---

## ⚙️ Tech Stack

* **Database**: PostgreSQL
* **Schema Design**: SQL DDL
* **ER Modeling**: 3rd Normal Form (3NF)

---

## 📌 Notes

* All timestamps default to the current time of insertion.
* UUIDs are used as primary keys for better scalability and uniqueness across distributed systems.

---
