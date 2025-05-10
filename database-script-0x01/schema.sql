-- =========================== AIRBNB DB TABLES IN POSTGRESQL ===========================

-- ===========================
-- ENUM Definitions
-- ===========================
CREATE TYPE user_role AS ENUM ('guest', 'host', 'admin');
CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'canceled');
CREATE TYPE payment_method AS ENUM ('credit_card', 'paypal', 'stripe');

-- ===========================
-- User Table
-- ===========================
CREATE TABLE users (
    user_id UUID,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    password_hash VARCHAR NOT NULL,
    phone_number VARCHAR,
    role user_role NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	
	CONSTRAINT users_pk PRIMARY KEY (user_id)
);

CREATE INDEX idx_users_email ON users(email);

-- ===========================
-- Property Table
-- ===========================
CREATE TABLE properties (
    property_id UUID,
    host_id UUID NOT NULL,
    "name" VARCHAR NOT NULL,
    description TEXT NOT NULL,
    "location" VARCHAR NOT NULL,
    price_per_night DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT properties_pk PRIMARY KEY (property_id),
	CONSTRAINT fk_properties_host_id FOREIGN KEY (host_id)
        REFERENCES users(user_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE INDEX idx_properties_property_id ON properties(property_id);

-- ===========================
-- Booking Table
-- ===========================
CREATE TABLE bookings (
    booking_id UUID,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status booking_status NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT bookings_pk PRIMARY KEY (booking_id),
	CONSTRAINT fk_bookings_property_id FOREIGN KEY (property_id)
        REFERENCES properties(property_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
	CONSTRAINT fk_bookings_user_id FOREIGN KEY (user_id)
        REFERENCES users(user_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_booking_id ON bookings(booking_id);

-- ===========================
-- Payment Table
-- ===========================
CREATE TABLE payments (
    payment_id UUID,
    booking_id UUID NOT NULL,
    amount DECIMAL NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method payment_method NOT NULL,

	CONSTRAINT payments_pk PRIMARY KEY (payment_id),
	CONSTRAINT fk_payments_booking_id FOREIGN KEY (booking_id)
        REFERENCES bookings(booking_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- ===========================
-- Review Table
-- ===========================
CREATE TABLE reviews (
    review_id UUID,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    "comment" TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT reviews_pk PRIMARY KEY (review_id),
	CONSTRAINT fk_reviews_property_id FOREIGN KEY (property_id)
        REFERENCES properties(property_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
	CONSTRAINT fk_reviews_user_id FOREIGN KEY (user_id)
        REFERENCES users(user_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- ===========================
-- Message Table
-- ===========================
CREATE TABLE messages (
    message_id UUID,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT messages_pk PRIMARY KEY (message_id),
	CONSTRAINT fk_messages_sender_id FOREIGN KEY (sender_id)
        REFERENCES users(user_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
	CONSTRAINT fk_messages_recipient_id FOREIGN KEY (recipient_id)
        REFERENCES users(user_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
