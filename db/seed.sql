USE campushub;

INSERT INTO users (name, email, password, role)
VALUES ('CampusHub Organiser', 'organiser@campushub.local', 'placeholder-password', 'organiser')
ON DUPLICATE KEY UPDATE name = VALUES(name), role = VALUES(role);

SET @organiserId = (
  SELECT id FROM users WHERE email = 'organiser@campushub.local'
);

INSERT INTO events
  (title, description, category, venue, startsAt, capacity, organiserId, published)
VALUES
  ('Welcome Fair', 'Meet student societies and campus services.', 'Community', 'Main Hall', '2026-10-20 10:00:00', 250, @organiserId, TRUE),
  ('Web Development Workshop', 'Build a small full-stack feature with guided support.', 'Technology', 'Computing Lab 2', '2026-10-24 13:30:00', 40, @organiserId, TRUE),
  ('Autumn Football Tournament', 'A friendly five-a-side tournament for students.', 'Sport', 'Campus Sports Field', '2026-11-02 09:00:00', 80, @organiserId, FALSE)
ON DUPLICATE KEY UPDATE title = VALUES(title);

SELECT id, title, category, startsAt FROM events ORDER BY startsAt;

