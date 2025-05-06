## Database Normalization

To ensure data integrity and eliminate redundancy, the database schema for the Airbnb Clone project has been normalized to **Third Normal Form (3NF)**. Below is a summary of the normalization process applied:

### First Normal Form (1NF)

* **Goal**: Eliminate repeating groups and ensure atomic values.
* **Action**: All tables have uniquely identifiable rows with primary keys. Each field contains only indivisible data (e.g., no multiple values in one column like multiple emails or phone numbers).

### Second Normal Form (2NF)

* **Goal**: Remove partial dependencies (i.e., no non-key attribute depends on a part of a composite key).
* **Action**: All non-key attributes are fully dependent on their respective table’s primary key. Composite keys are avoided unless necessary, and related data is split into separate tables—for example, user data is separated from property data.

### Third Normal Form (3NF)

* **Goal**: Remove transitive dependencies (non-key attributes should not depend on other non-key attributes).
* **Action**:

  * Payment details (like amount, date, and status) are kept in a separate `Payments` table and linked via `booking_id`, avoiding redundancy in the `Bookings` table.
  * User roles (host or guest) are stored as a single field in the `Users` table, and if needed, can be abstracted into a `Roles` table later.
  * Reviews store only foreign keys to users and properties—any display names or property titles are referenced, not duplicated.
