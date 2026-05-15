
CREATE TABLE rent_analysis (
    id SERIAL PRIMARY KEY,
    city VARCHAR(100),
    district VARCHAR(100),
    price_monthly NUMERIC(10, 2),
    size_sqm INT,
    room_count VARCHAR(10),
    floor_level INT,
    building_age INT,
    is_furnished BOOLEAN DEFAULT FALSE
);
