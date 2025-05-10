# AirBnB Database - Sample Data

## Objective
Populate the AirBnB PostgreSQL database with realistic sample data for development and testing purposes.

## Description
This SQL script inserts sample records into the core tables of the database:
- `users`
- `properties`
- `bookings`
- `payments`
- `reviews`
- `messages`

Each entry simulates real-world scenarios involving hosts, guests, properties, booking activity, and communication.

## Highlights
- Includes multiple users with different roles (`guest`, `host`, `admin`)
- Demonstrates bookings across properties and users
- Adds example payments and reviews for booked stays
- Captures typical message exchanges between users

## Usage
1. Ensure all tables and ENUM types are created first (see `schema.sql`)
2. Run the sample data script using your preferred PostgreSQL client:

```bash
psql -U your_user -d your_database -f sample_data.sql
````
