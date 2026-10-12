# CampusHub

A campus events and bookings application for Full-Stack Development (S170345), Semester 7.

## Running locally

1. Copy `server/.env.example` to `server/.env` and set the database values.
2. Run `mysql -u root -p -e "source db/schema.sql"` from the repository root.
3. Run `mysql -u root -p -e "source db/seed.sql"` to add the sample data.
4. Run `cd server; npm install; npm run dev` to start the API on port 4000.
5. In another terminal, run `cd client; npm install; npm run dev` to start the client on port 5173.

The API health endpoint is available at `http://localhost:4000/api/health`.

