# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Grade.destroy_all
Assignment.destroy_all
Enrollment.destroy_all
Course.destroy_all
Student.destroy_all

#seeded data for an admin account teacher account and student account followed by an example course example assignments and grades

admin = Student.create!(
    name:"Admin account",
    email: "admin@example.com",
    password: "adminpassword",
    password_confirmation: "adminpassword",
    role: "admin"
)

teacher = Student.create!(
    name:"Teach account",
    email: "teacher@example.com",
    password: "teacherpassword",
    password_confirmation: "teacherpassword",
    role: "teacher"
)

student1 = Student.create!(
    name:"Vedh",
    email: "vedh@example.com",
    password: "student1password",
    password_confirmation: "student1password",
    role: "student"
)

student2 = Student.create!(
    name:"Anna",
    email: "anna@example.com",
    password: "student2password",
    password_confirmation: "student2password",
    role: "student"
)

course = Course.create!(
    title: "Secure Coding and Testing",
    description: "Learn about methods to secure code and different vulnerabilites attackers use...",
    student: teacher #error in the code but this should still work
)

Enrollment.create!(student: student1, course: course)
Enrollment.create!(student: student2, course: course)

assignment1 = Assignment.create!(
    title: "Midterm Exam",
    description: "Exam covering the material from the start till now.",
    due_date: Date.today + 5,
    course: course
)


assignment2 = Assignment.create!(
    title: "Final Project",
    description: "Final project for this course make a program to showcase a vulnerability",
    due_date: Date.today + 10,
    course: course
)

Grade.create!(
    score: 85,
    feedback: "Make sure to explain your reasoning.",
    student: student1,
    assignment: assignment2
)

Grade.create!(
    score: 100,
    feedback: "Perfect job!",
    student: student2,
    assignment: assignment1
)

Grade.create!(
    score: 70,
    feedback: "Needs to be more detailed on your answers.",
    student: student1,
    assignment: assignment2
)

Grade.create!(
    score: 89,
    feedback: "Follow the proper format next time!",
    student: student2,
    assignment: assignment1
)
