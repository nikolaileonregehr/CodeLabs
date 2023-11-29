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
User.destroy_all
owner = User.create!(email: "owner@owner.com", password: "123456")
client = User.create!(email: "user@user.com", password: "123456")

# Courses
# Course 1
file1 = URI.open("https://apexensino.com.br/wp-content/uploads/2020/05/python-1280x640.jpg")
product1 = Product.new(subject: "Python Basics", description: 'Introductory course covering the fundamental concepts of Python programming, including variables, data types, control structures, and basic functions.', duration: "20 hours", level: "Beginner")
product1.photo.attach(io: file1, filename: "nes.png", content_type: "image/png")
product1.save!
product1.reload

#Course 1 - Chapters
chapter1 = Chapter.create!(title: "Introduction to Python", content: "This chapter covers the basics of Python.", product: product1)
chapter2 = Chapter.create!(title: "Python Variables", content: "Learn about variables in Python.", product: product1)
chapter3 = Chapter.create!(title: "Data Types in Python", content: "Explore different data types in Python, such as strings, numbers, and lists.", product: product1)
chapter4 = Chapter.create!(title: "Control Structures in Python", content: "Understand control structures like loops and conditional statements in Python.", product: product1)
chapter5 = Chapter.create!(title: "Basic Functions in Python", content: "Learn the basics of defining and using functions in Python.", product: product1)

# Course 2
file2 = URI.open("https://ideacdn.net/idea/ct/82/myassets/blogs/html-css.jpg?revision=1581690718")
product2 = Product.new(subject: "HTML and CSS Basics", description: 'Foundational course focusing on HTML and CSS, covering the essentials of structuring web content and styling web pages.', duration: "15 hours", level: "Beginner")
product2.photo.attach(io: file2, filename: "nes.png", content_type: "image/png")
product2.save!

file3 = URI.open("https://bairesdev.mo.cloudinary.net/blog/2023/08/What-Is-JavaScript-Used-For.jpg?tx=w_1920,q_auto")
product3 = Product.new(subject: "JavaScript Basics", description: 'Beginner-friendly course introducing the basics of JavaScript, including variables, functions, control flow, and basic DOM manipulation.', duration: "20 hours", level: "Beginner")
product3.photo.attach(io: file3, filename: "nes.png", content_type: "image/png")
product3.save!

# Course 4
file4 = URI.open("https://blog.ebaconline.com.br/blog/wp-content/uploads/2023/04/image3-5-e1681758172172.jpg")
product4 = Product.new(subject: "Large Databases & SQL", description: 'Introductory course on SQL, focusing on managing and querying relational databases. Covers basic SQL commands and database design.', duration: "25 hours", level: "Beginner")
product4.photo.attach(io: file4, filename: "nes.png", content_type: "image/png")
product4.save!

# Course 5
file5 = URI.open("https://cognablogs.s3.amazonaws.com/academiatech.blog.br/wp-content/uploads/2023/02/22202334/c-21022023.webp")
product5 = Product.new(subject: "C++ Basics", description: 'Entry-level course covering the fundamentals of C++ programming, including variables, data types, control structures, and basic object-oriented concepts.', duration: "20 hours", level: "Beginner")
product5.photo.attach(io: file5, filename: "nes.png", content_type: "image/png")
product5.save!

# Course 6
file6 = URI.open("https://www.wisecube.ai/wp-content/uploads/2023/05/Featured-Blog-Image-A-Comprehensive-Overview-of-Large-Language-Models-1080x675.jpg")
product6 = Product.new(subject: "Intro to LLMs", description: 'Foundational course introducing the concepts and applications of Large Language Models, exploring their capabilities and use cases.', duration: "15 hours", level: "Beginner")
product6.photo.attach(io: file6, filename: "nes.png", content_type: "image/png")
product6.save!

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

file9 = URI.open("https://cyberhoot.com/wp-content/uploads/2022/03/windows-batch-files-1024x512.jpg")
product9 = Product.new(subject: "Intro to the Command Line", description: 'Beginner-friendly course introducing the basics of the command-line interface, covering commands for navigation, file manipulation, and basic system tasks.', duration: "12 hours", level: "Beginner")
product9.photo.attach(io: file9, filename: "nes.png", content_type: "image/png")
product9.save!

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
