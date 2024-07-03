# Checklist for Mathematics Challenge System

## System Initialization
- [X] Set up the database schema.
  - [X] Schools table
  - [X] Administrators table
  - [X] Questions table
  - [ ] Answers table
  - [X] Challenges table
  - [X] Participants table
  - [X] RejectedParticipants table
  - [X] ParticipantAttempts table
- [X] Configure server and database connections.
- [ ] Create user roles (Administrator, School Representative, Participant).

## School Registration and Validation
- [ ] Upload schools data.
  - [ ] Fields: Name, District, School Registration Number, Representative Name, Representative Email
- [ ] Validate school representatives.
  - [ ] Send email notifications for validation.
  - [ ] Confirm validation in the database.

## Question and Answer Management
- [ ] Develop functionality to upload questions and answers.
  - [ ] Import questions from questions.xlsx.
  - [ ] Import answers from answers.xlsx.
  - [ ] Verify the alignment of questions and answers.
- [ ] Store questions and answers in the database.
- [ ] Assign marks to each question.

## Challenge Management
- [ ] Create functionality to define and open challenges.
  - [ ] Set challenge parameters: start date, end date, duration, number of questions.
- [ ] Randomly select questions for each challenge attempt.

## Participant Registration
- [ ] Develop command-line interface for participant registration.
  - [ ] Inputs: username, firstname, lastname, email, date_of_birth, school_registration_number, image_file.png
- [ ] Validate school registration number.
  - [ ] If invalid, inform the participant.
  - [ ] If valid, log the registration and send an email to the school representative.

## School Representative Confirmation
- [ ] Develop CLI for school representatives to view and confirm applicants.
  - [ ] Display list of applicants.
  - [ ] Confirm or reject applicants.
  - [ ] Update database accordingly (move rejected applicants to RejectedParticipants table).

## Participant Login and Challenge Participation
- [ ] Develop CLI for participants to log in.
- [ ] Display available challenges using viewChallenges command.
- [ ] Implement attemptChallenge command.
  - [ ] Validate challenge and participant eligibility.
  - [ ] Select random questions for the challenge.
  - [ ] Present questions one by one.
  - [ ] Track remaining questions and time.
  - [ ] Implement scoring logic:
    - [ ] Correct answer: award assigned marks.
    - [ ] Wrong answer: deduct 3 marks.
    - [ ] Not sure (input -): award 0 marks.
  - [ ] Record attempt details in ParticipantAttempts table.

## Challenge Completion and Reporting
- [ ] Generate participant report at the end of the challenge.
  - [ ] Include scores and time taken for each question.
  - [ ] Include total time and overall score.
- [ ] Send email notifications with PDF report to participants.
- [ ] Recognize the top two participants on the website.
