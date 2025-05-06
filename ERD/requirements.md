## Entity-Relationship (ER) Diagram

The ER diagram outlines the core structure of the database, showing how entities relate to one another in the Airbnb Clone project.

### **Entities and Attributes**

1. **User**

   * `id` (Primary Key)
   * `username`
   * `email`
   * `password_hash`
   * `role` (e.g., guest, host)

2. **Property**

   * `id` (Primary Key)
   * `title`
   * `description`
   * `location`
   * `price_per_night`
   * `host_id` (Foreign Key → User)

3. **Booking**

   * `id` (Primary Key)
   * `user_id` (Foreign Key → User)
   * `property_id` (Foreign Key → Property)
   * `check_in`
   * `check_out`
   * `status`

4. **Review**

   * `id` (Primary Key)
   * `user_id` (Foreign Key → User)
   * `property_id` (Foreign Key → Property)
   * `rating`
   * `comment`

5. **Payment**

   * `id` (Primary Key)
   * `booking_id` (Foreign Key → Booking)
   * `amount`
   * `payment_date`
   * `payment_status`

---

### **Relationships**

* **User <-> Property**: One user (host) can list many properties (1\:N).
* **User <-> Booking**: One user can make many bookings (1\:N).
* **User <-> Review**: One user can write many reviews (1\:N).
* **Property <-> Booking**: One property can be booked many times (1\:N).
* **Property <-> Review**: One property can have many reviews (1\:N).
* **Booking <-> Payment**: One booking has one payment (1:1).

The ER diagram link is [here](https://drive.google.com/file/d/13P4IFiWs7HvAE--CWchjTz3yjMWR0Uz3/view?usp=sharing).
