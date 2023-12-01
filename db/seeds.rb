# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
Product.destroy_all
Message.destroy_all
Chatroom.destroy_all
User.destroy_all
owner = User.create!(email: "owner@owner.com", password: "123456", role: "teacher", first_name: "Owner", last_name: "owner")

client = User.create!(email: "user@user.com", password: "123456", role: "student", first_name: "student", last_name: "castro")
User.create!(email: "gpt@gpt.com", password: "123456", role: "gpt_user", first_name: "ChatGPT", last_name: "ChatGPT")

# Courses
# Course 1
file1 = URI.open("https://apexensino.com.br/wp-content/uploads/2020/05/python-1280x640.jpg")
product1 = Product.new(subject: "Python Basics", description: 'Introductory course covering the fundamental concepts of Python programming, including variables, data types, control structures, and basic functions.', duration: "20 hours", level: "Beginner")
product1.photo.attach(io: file1, filename: "nes.png", content_type: "image/png")
product1.save!
product1.reload

#Course 1 - Chapters
Chapter.create!(title: "Introduction to Python", content: "This chapter covers the basics of Python.", product: product1)
Chapter.create!(title: "Python Variables", content: "Learn about variables in Python.", product: product1)
Chapter.create!(title: "Data Types in Python", content: "Explore different data types in Python, such as strings, numbers, and lists.", product: product1)
Chapter.create!(title: "Control Structures in Python", content: "Understand control structures like loops and conditional statements in Python.", product: product1)
Chapter.create!(title: "Basic Functions in Python", content: "Learn the basics of defining and using functions in Python.", product: product1)

# Course 2
file2 = URI.open("https://ideacdn.net/idea/ct/82/myassets/blogs/html-css.jpg?revision=1581690718")
product2 = Product.new(subject: "HTML and CSS Basics", description: 'Foundational course focusing on HTML and CSS, covering the essentials of structuring web content and styling web pages.', duration: "15 hours", level: "Beginner")
product2.photo.attach(io: file2, filename: "nes.png", content_type: "image/png")
product2.save!

#Course 2 - Chapters
Chapter.create!(title: "Introduction to HTML", content: "This chapter covers the basics of HTML, the markup language used to create web pages.", product: product2)
Chapter.create!(title: "Introduction to CSS", content: "Learn the fundamentals of CSS for styling and formatting HTML documents.", product: product2)
Chapter.create!(title: "Structuring HTML Documents", content: "Explore the proper structuring of HTML documents, including headings, paragraphs, and lists.", product: product2)
Chapter.create!(title: "CSS Styling Techniques", content: "Dive into various CSS styling techniques for designing visually appealing web pages.", product: product2)
Chapter.create!(title: "Responsive Web Design", content: "Understand the principles of responsive web design using HTML and CSS.", product: product2)

# Course 3
file3 = URI.open("https://bairesdev.mo.cloudinary.net/blog/2023/08/What-Is-JavaScript-Used-For.jpg?tx=w_1920,q_auto")
product3 = Product.new(subject: "JavaScript Basics", description: 'Beginner-friendly course introducing the basics of JavaScript, including variables, functions, control flow, and basic DOM manipulation.', duration: "20 hours", level: "Beginner")
product3.photo.attach(io: file3, filename: "nes.png", content_type: "image/png")
product3.save!

#Course 3 - Chapters
Chapter.create!(title: "Introduction to JavaScript", content: "This chapter provides an overview of JavaScript and its role in web development.", product: product3)
Chapter.create!(title: "JavaScript Variables and Data Types", content: "Learn about variables and different data types in JavaScript.", product: product3)
Chapter.create!(title: "Control Flow in JavaScript", content: "Understand how control flow works in JavaScript, including loops and conditional statements.", product: product3)
Chapter.create!(title: "JavaScript Functions", content: "Explore the basics of defining and using functions in JavaScript.", product: product3)
Chapter.create!(title: "DOM Manipulation with JavaScript", content: "Learn how to manipulate the Document Object Model (DOM) using JavaScript.", product: product3)

# Course 4
file4 = URI.open("https://blog.ebaconline.com.br/blog/wp-content/uploads/2023/04/image3-5-e1681758172172.jpg")
product4 = Product.new(subject: "Large Databases & SQL", description: 'Introductory course on SQL, focusing on managing and querying relational databases. Covers basic SQL commands and database design.', duration: "25 hours", level: "Beginner")
product4.photo.attach(io: file4, filename: "nes.png", content_type: "image/png")
product4.save!

#Course 4 - Chapters
Chapter.create!(title: "Introduction to Relational Databases", content: "This chapter introduces the concept of relational databases and their importance.", product: product4)
Chapter.create!(title: "SQL Basics", content: "Learn the fundamental SQL commands for managing and querying databases.", product: product4)
Chapter.create!(title: "Database Design Principles", content: "Understand the principles of designing effective and scalable databases.", product: product4)
Chapter.create!(title: "Advanced SQL Queries", content: "Explore more advanced SQL queries for complex data retrieval.", product: product4)
Chapter.create!(title: "Database Management", content: "Learn about practical aspects of managing large databases.", product: product4)

# Course 5
file5 = URI.open("https://cognablogs.s3.amazonaws.com/academiatech.blog.br/wp-content/uploads/2023/02/22202334/c-21022023.webp")
product5 = Product.new(subject: "C++ Basics", description: 'Entry-level course covering the fundamentals of C++ programming, including variables, data types, control structures, and basic object-oriented concepts.', duration: "20 hours", level: "Beginner")
product5.photo.attach(io: file5, filename: "nes.png", content_type: "image/png")
product5.save!

#Course 5 - Chapters
Chapter.create!(title: "Introduction to C++", content: "This chapter provides an introduction to the C++ programming language.", product: product5)
Chapter.create!(title: "C++ Variables and Data Types", content: "Learn about variables and different data types in C++.", product: product5)
Chapter.create!(title: "Control Structures in C++", content: "Understand control structures, including loops and conditional statements in C++.", product: product5)
Chapter.create!(title: "Object-Oriented Programming in C++", content: "Explore basic concepts of object-oriented programming (OOP) in C++.", product: product5)
Chapter.create!(title: "Advanced C++ Concepts", content: "Dive into more advanced concepts in C++ programming.", product: product5)

# Course 6
file6 = URI.open("https://www.wisecube.ai/wp-content/uploads/2023/05/Featured-Blog-Image-A-Comprehensive-Overview-of-Large-Language-Models-1080x675.jpg")
product6 = Product.new(subject: "Intro to LLMs", description: 'Foundational course introducing the concepts and applications of Large Language Models, exploring their capabilities and use cases.', duration: "15 hours", level: "Beginner")
product6.photo.attach(io: file6, filename: "nes.png", content_type: "image/png")
product6.save!

# Course 6 - Chapter
Chapter.create!(title: "Introduction to Large Language Models", content: "This chapter provides an overview of Large Language Models and their applications.", product: product6)
Chapter.create!(title: "Working with Pre-trained Models", content: "Learn how to work with pre-trained LLMs for various tasks.", product: product6)
Chapter.create!(title: "Fine-tuning Models", content: "Explore the process of fine-tuning LLMs for specific applications.", product: product6)
Chapter.create!(title: "Use Cases of LLMs", content: "Understand real-world use cases and applications of Large Language Models.", product: product6)

# Course 7
file7 = URI.open("https://www.minfytech.com/wp-content/uploads/2023/08/Prompts.png")
product7 = Product.new(subject: "Prompt Engineering Basics", description: 'Course focusing on prompt engineering techniques for analytics and natural language processing, emphasizing effective use of language to generate desired responses from models.', duration: "25 hours", level: "Intermediary")
product7.photo.attach(io: file7, filename: "nes.png", content_type: "image/png")
product7.save!

# Course 8
file8 = URI.open("https://www.protocol.com/media-library/openai-s-logo.png?id=27994350&width=1245&height=700&quality=85&coordinates=0%2C0%2C0%2C0")
product8 = Product.new(subject: "Intro to OpenAI GPT API", description: 'Introductory course on using the OpenAI GPT API, covering API integration, understanding response formats, and leveraging GPT for various applications.', duration: "20 hours", level: "Beginner")
product8.photo.attach(io: file8, filename: "nes.png", content_type: "image/png")
product8.save!

# Course 9
file9 = URI.open("https://cyberhoot.com/wp-content/uploads/2022/03/windows-batch-files-1024x512.jpg")
product9 = Product.new(subject: "Intro to the Command Line", description: 'Beginner-friendly course introducing the basics of the command-line interface, covering commands for navigation, file manipulation, and basic system tasks.', duration: "12 hours", level: "Beginner")
product9.photo.attach(io: file9, filename: "nes.png", content_type: "image/png")
product9.save!

# Course 10
file10 = URI.open("https://blog.carbonfive.com/wp-content/uploads/2021/10/Matt-Brictson-Interview-Ruby-on-Rails.png")
product10 = Product.new(subject: "Intro to Ruby on Rails", description: 'Introductory course to Ruby on Rails, covering the basics of MVC architecture, routing, and creating simple web applications using the Ruby programming language.', duration: "25 hours", level: "Beginner")
product10.photo.attach(io: file10, filename: "nes.png", content_type: "image/png")
product10.save!

# Course 11
file11 = URI.open("https://www.wilde-it.com/wp-content/uploads/2021/12/bootstrap.jpg")
product11 = Product.new(subject: "Intro to Bootstrap", description: 'Course focused on creating responsive web designs using the Bootstrap framework. Covers the basics of grid systems, components, and responsive navigation.', duration: "10 hours", level: "Beginner")
product11.photo.attach(io: file11, filename: "nes.png", content_type: "image/png")
product11.save!

# Course 12
file12 = URI.open("https://miro.medium.com/v2/resize:fit:1400/format:webp/0*_yc86ghRrI7YYidw")
product12 = Product.new(subject: "Intro to Git & Version Control", description: 'Introductory course covering the fundamentals of Git and version control. Includes branching, merging, and collaboration workflows with Git.', duration: "6 hours", level: "Beginner")
product12.photo.attach(io: file12, filename: "nes.png", content_type: "image/png")
product12.save!
