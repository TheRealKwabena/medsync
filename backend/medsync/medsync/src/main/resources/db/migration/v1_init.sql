-- Users Table
CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       email VARCHAR(255) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       role VARCHAR(20) NOT NULL
);

-- Medications Table
CREATE TABLE medications (
                             id SERIAL PRIMARY KEY,
                             name VARCHAR(255) NOT NULL,
                             dosage VARCHAR(100) NOT NULL,
                             manufacturer VARCHAR(255) NOT NULL
);

-- Medication Schedules Table
CREATE TABLE medication_schedules (
                                      id SERIAL PRIMARY KEY,
                                      user_id BIGINT REFERENCES users(id) ON DELETE CASCADE,
                                      medication_id BIGINT REFERENCES medications(id) ON DELETE CASCADE,
                                      schedule_time TIMESTAMP NOT NULL,
                                      is_taken BOOLEAN DEFAULT FALSE,
                                      is_missed BOOLEAN DEFAULT FALSE
);

-- Kafka Event Log Table
CREATE TABLE event_logs (
                            id SERIAL PRIMARY KEY,
                            event_type VARCHAR(255) NOT NULL,
                            payload TEXT NOT NULL,
                            timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
