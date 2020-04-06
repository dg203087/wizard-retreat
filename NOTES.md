Associations

Wizard
has many registrations
has many courses, through registrations
email
password_digest
first name
last name
house
admin

Course
has many registrations
has many wizards, through registrations
name
description
location
maximum_participants
time slot

Registration
belongs to wizard
belongs to course
wizard_id
course_id

