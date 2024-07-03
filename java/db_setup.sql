CREATE DATABASE math_quest;

USE math_quest;

-- Table for Schools
CREATE TABLE schools (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    district VARCHAR(255) NOT NULL,
    school_registration_number VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) NOT NULL,
    representative_name VARCHAR(255) NOT NULL
);

-- Table for Participants
CREATE TABLE participants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    school_registration_number VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    status VARCHAR(255) NOT NULL DEFAULT 'confirmed',
    FOREIGN KEY (school_registration_number) REFERENCES schools(school_registration_number)
);

-- Table for Applicants
CREATE TABLE applicants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    school_registration_number VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL
);

-- Table for Challenges
CREATE TABLE challenges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    duration INT NOT NULL,
    num_questions INT NOT NULL,
    description VARCHAR(255) NOT NULL
);

-- Table for Questions
CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_text TEXT NOT NULL,
    answer TEXT NOT NULL,
    marks INT NOT NULL
);

-- Table for Participant Attempts
CREATE TABLE participant_attempts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    participant_id INT NOT NULL,
    challenge_id INT NOT NULL,
    attempt_number INT NOT NULL,
    score INT NOT NULL,
    time_taken INT NOT NULL,
    FOREIGN KEY (participant_id) REFERENCES participants(id),
    FOREIGN KEY (challenge_id) REFERENCES challenges(id)
);

-- Table for Rejected Applicants
CREATE TABLE rejected_applicants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    reason TEXT NOT NULL
);

CREATE TABLE school_representatives (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
)
