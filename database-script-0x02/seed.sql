-- ===========================
-- Sample Users
-- ===========================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('00000000-0000-0000-0000-000000000001', 'Alice', 'Wong', 'alice@example.com', 'hashed_pass1', '1234567890', 'guest'),
  ('00000000-0000-0000-0000-000000000002', 'Bob', 'Smith', 'bob@example.com', 'hashed_pass2', '0987654321', 'host'),
  ('00000000-0000-0000-0000-000000000003', 'Charlie', 'Johnson', 'charlie@example.com', 'hashed_pass3', NULL, 'guest'),
  ('00000000-0000-0000-0000-000000000004', 'Diana', 'Brown', 'diana@example.com', 'hashed_pass4', '1122334455', 'admin');

-- ===========================
-- Sample Properties
-- ===========================
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES
  ('10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Cozy Cottage', 'A cozy cottage in the countryside.', 'Nairobi, Kenya', 50.00),
  ('10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', 'Modern Apartment', 'Modern apartment in the city center.', 'Mombasa, Kenya', 85.00);

-- ===========================
-- Sample Bookings
-- ===========================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', '2025-06-01', '2025-06-05', 200.00, 'confirmed'),
  ('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000003', '2025-07-10', '2025-07-15', 425.00, 'pending');

-- ===========================
-- Sample Payments
-- ===========================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
  ('30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000001', 200.00, 'credit_card');

-- ===========================
-- Sample Reviews
-- ===========================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
  ('40000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 5, 'Amazing stay, loved the cottage!'),
  ('40000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000003', 4, 'Great place, very clean and convenient.');

-- ===========================
-- Sample Messages
-- ===========================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
  ('50000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Hi Bob, is the cottage available on June 1st?'),
  ('50000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Yes, it is. I just confirmed your booking.');

