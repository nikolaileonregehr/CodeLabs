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
Chapter.destroy_all
Favorite.destroy_all
Product.destroy_all
Message.destroy_all
GptMessage.destroy_all
Chatroom.destroy_all
GptChatroom.destroy_all
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
chapter1 = Chapter.create!(title: "Introduction to Python", description: "This chapter covers the basics of Python.", product: product1, video_id: "kqtD5dpn9C8")
chapter1.update!(content:
  "<p>Welcome to the world of <strong>Python</strong>! Python is a versatile and powerful programming language known for its readability and ease of use. In this chapter, we embark on a journey to explore the fundamental concepts and syntax of the Python programming language.</p>

  <p>We'll cover the basic structure of a Python program, including variables, data types, and the importance of indentation. By the end of this chapter, you'll have a solid foundation to start writing your own Python scripts and programs.</p>

  <p>Whether you're a beginner or an experienced programmer, understanding the basics of Python is essential for building a strong programming skillset. Let's dive into the world of Python programming together!</p>"
)

chapter2 = Chapter.create!(title: "Python Variables", description: "Learn about variables in Python.", product: product1, video_id: "cQT33yu9pY8")
chapter2.update!(content:
  "<p>In this chapter, we explore the concept of <strong>variables</strong> in <strong>Python</strong>. Variables are like containers that allow you to store and manage data in your programs. Understanding how to work with variables is a fundamental skill for any Python developer.</p>

  <p>We'll cover variable naming conventions, data assignment, and the different data types that variables can hold. By the end of this chapter, you'll be comfortable creating and manipulating variables, a skill crucial for more advanced Python programming.</p>

  <p>Get ready to grasp the core concepts of variables and take your first steps towards becoming a proficient Python programmer!</p>"
)

chapter3 = Chapter.create!(title: "Data Types in Python", description: "Explore different data types in Python, such as strings, numbers, and lists.", product: product1, video_id: "ppsCxnNm-JI")
chapter3.update!(content:
  "<p>Embark on a journey into the diverse world of <strong>data types</strong> in <strong>Python</strong>. Data types are the building blocks of any programming language, and Python provides a rich set of them. In this chapter, we'll explore essential data types such as <strong>strings</strong>, <strong>numbers</strong>, and <strong>lists</strong>.</p>

  <p>Learn how to manipulate strings, perform mathematical operations with numbers, and organize data using lists. Understanding data types is crucial for writing effective and efficient Python code. By the end of this chapter, you'll have a solid grasp of Python's versatile data types and their applications.</p>

  <p>Join us on this exploration of data types, a key aspect of mastering Python programming!</p>"
)

chapter4 = Chapter.create!(title: "Control Structures in Python", description: "Understand control structures like loops and conditional statements in Python.", product: product1, video_id: "Zp5MuPOtsSY")
chapter4.update!(content:
  "<p>Dive deep into the world of <strong>control structures</strong> in <strong>Python</strong>. Control structures allow you to dictate the flow of your programs, making them dynamic and responsive. In this chapter, we'll focus on two fundamental control structures: <strong>loops</strong> and <strong>conditional statements</strong>.</p>

  <p>Explore how loops enable you to repeat actions efficiently, and discover the power of conditional statements to make decisions within your code. Mastering control structures is essential for writing more complex and interactive Python programs.</p>

  <p>Join us as we unravel the intricacies of control structures and empower your Python programming skills!</p>"

)

chapter5 = Chapter.create!(title: "Basic Functions in Python", description: "Learn the basics of defining and using functions in Python.", product: product1, video_id: "u-OmVr_fT4s")
chapter5.update!(content:
  "<p>Unlock the potential of <strong>functions</strong> in <strong>Python</strong>! Functions allow you to organize your code into reusable blocks, making your programs more modular and maintainable. In this chapter, we'll cover the basics of defining and using functions.</p>

  <p>Learn how to create functions, pass parameters, and return values. Understanding functions is a crucial step towards writing efficient and scalable Python code. By the end of this chapter, you'll be equipped with the knowledge to design and implement your own functions.</p>

  <p>Join us on this exploration of basic functions and elevate your Python programming expertise!</p>"
)

# Course 2
file2 = URI.open("https://ideacdn.net/idea/ct/82/myassets/blogs/html-css.jpg?revision=1581690718")
product2 = Product.new(subject: "HTML and CSS Basics", description: 'Foundational course focusing on HTML and CSS, covering the essentials of structuring web content and styling web pages.', duration: "15 hours", level: "Beginner")
product2.photo.attach(io: file2, filename: "nes.png", content_type: "image/png")
product2.save!

#Course 2 - Chapters
chapter6 = Chapter.create!(title: "Introduction to HTML", description: "This chapter covers the basics of HTML, the markup language used to create web pages.", product: product2)
chapter7 = Chapter.create!(title: "Introduction to CSS", description: "Learn the fundamentals of CSS for styling and formatting HTML documents.", product: product2)
chapter8 = Chapter.create!(title: "Structuring HTML Documents", description: "Explore the proper structuring of HTML documents, including headings, paragraphs, and lists.", product: product2)
chapter9 = Chapter.create!(title: "CSS Styling Techniques", description: "Dive into various CSS styling techniques for designing visually appealing web pages.", product: product2)
chapter10 = Chapter.create!(title: "Responsive Web Design", description: "Understand the principles of responsive web design using HTML and CSS.", product: product2)

# Course 3
file3 = URI.open("https://bairesdev.mo.cloudinary.net/blog/2023/08/What-Is-JavaScript-Used-For.jpg?tx=w_1920,q_auto")
product3 = Product.new(subject: "JavaScript Basics", description: 'Beginner-friendly course introducing the basics of JavaScript, including variables, functions, control flow, and basic DOM manipulation.', duration: "20 hours", level: "Beginner")
product3.photo.attach(io: file3, filename: "nes.png", content_type: "image/png")
product3.save!

#Course 3 - Chapters
chapter11 = Chapter.create!(title: "Introduction to JavaScript", description: "This chapter provides an overview of JavaScript and its role in web development.", product: product3)
chapter12 = Chapter.create!(title: "JavaScript Variables and Data Types", description: "Learn about variables and different data types in JavaScript.", product: product3)
chapter13 = Chapter.create!(title: "Control Flow in JavaScript", description: "Understand how control flow works in JavaScript, including loops and conditional statements.", product: product3)
chapter14 = Chapter.create!(title: "JavaScript Functions", description: "Explore the basics of defining and using functions in JavaScript.", product: product3)
chapter15 = Chapter.create!(title: "DOM Manipulation with JavaScript", description: "Learn how to manipulate the Document Object Model (DOM) using JavaScript.", product: product3)

# Course 4
file4 = URI.open("https://blog.ebaconline.com.br/blog/wp-content/uploads/2023/04/image3-5-e1681758172172.jpg")
product4 = Product.new(subject: "Large Databases & SQL", description: 'Introductory course on SQL, focusing on managing and querying relational databases. Covers basic SQL commands and database design.', duration: "25 hours", level: "Beginner")
product4.photo.attach(io: file4, filename: "nes.png", content_type: "image/png")
product4.save!

#Course 4 - Chapters
chapter16 = Chapter.create!(title: "Introduction to Relational Databases", description: "This chapter introduces the concept of relational databases and their importance.", product: product4)
chapter17 = Chapter.create!(title: "SQL Basics", description: "Learn the fundamental SQL commands for managing and querying databases.", product: product4)
chapter18 = Chapter.create!(title: "Database Design Principles", description: "Understand the principles of designing effective and scalable databases.", product: product4)
chapter19 = Chapter.create!(title: "Advanced SQL Queries", description: "Explore more advanced SQL queries for complex data retrieval.", product: product4)
chapter20 = Chapter.create!(title: "Database Management", description: "Learn about practical aspects of managing large databases.", product: product4)

# Course 5
file5 = URI.open("https://cognablogs.s3.amazonaws.com/academiatech.blog.br/wp-content/uploads/2023/02/22202334/c-21022023.webp")
product5 = Product.new(subject: "C++ Basics", description: 'Entry-level course covering the fundamentals of C++ programming, including variables, data types, control structures, and basic object-oriented concepts.', duration: "20 hours", level: "Beginner")
product5.photo.attach(io: file5, filename: "nes.png", content_type: "image/png")
product5.save!

#Course 5 - Chapters
chapter21 = Chapter.create!(title: "Introduction to C++", description: "This chapter provides an introduction to the C++ programming language.", product: product5)
chapter22 = Chapter.create!(title: "C++ Variables and Data Types", description: "Learn about variables and different data types in C++.", product: product5)
chapter23 = Chapter.create!(title: "Control Structures in C++", description: "Understand control structures, including loops and conditional statements in C++.", product: product5)
chapter24 = Chapter.create!(title: "Object-Oriented Programming in C++", description: "Explore basic concepts of object-oriented programming (OOP) in C++.", product: product5)
chapter25 = Chapter.create!(title: "Advanced C++ Concepts", description: "Dive into more advanced concepts in C++ programming.", product: product5)

# Course 6
file6 = URI.open("https://www.wisecube.ai/wp-content/uploads/2023/05/Featured-Blog-Image-A-Comprehensive-Overview-of-Large-Language-Models-1080x675.jpg")
product6 = Product.new(subject: "Intro to LLMs", description: 'Foundational course introducing the concepts and applications of Large Language Models, exploring their capabilities and use cases.', duration: "15 hours", level: "Beginner")
product6.photo.attach(io: file6, filename: "nes.png", content_type: "image/png")
product6.save!

# Course 6 - Chapter
chapter26 = Chapter.create!(title: "Introduction to Large Language Models", description: "This chapter provides an overview of Large Language Models and their applications.", product: product6)
chapter27 = Chapter.create!(title: "Working with Pre-trained Models", description: "Learn how to work with pre-trained LLMs for various tasks.", product: product6)
chapter28 = Chapter.create!(title: "Fine-tuning Models", description: "Explore the process of fine-tuning LLMs for specific applications.", product: product6)
chapter29 = Chapter.create!(title: "Use Cases of LLMs", description: "Understand real-world use cases and applications of Large Language Models.", product: product6)

# Course 7
file7 = URI.open("https://www.minfytech.com/wp-content/uploads/2023/08/Prompts.png")
product7 = Product.new(subject: "Prompt Engineering Basics", description: 'Course focusing on prompt engineering techniques for analytics and natural language processing, emphasizing effective use of language to generate desired responses from models.', duration: "25 hours", level: "Intermediary")
product7.photo.attach(io: file7, filename: "nes.png", content_type: "image/png")
product7.save!

# Course 7 - Chapter
chapter30 = Chapter.create!(title: "Introduction to Prompt Engineering", description: "This chapter provides an overview of prompt engineering and its applications.", product: product7)
chapter31 = Chapter.create!(title: "Analytical Use of Prompts", description: "Learn how prompts can be effectively used for analytical purposes.", product: product7)
chapter32 = Chapter.create!(title: "Natural Language Processing with Prompts", description: "Explore how prompts can be leveraged for natural language processing tasks.", product: product7)
chapter33 = Chapter.create!(title: "Generating Desired Responses", description: "Understand techniques for generating desired responses from models using prompts.", product: product7)
chapter34 = Chapter.create!(title: "Advanced Prompt Engineering", description: "Dive into advanced techniques and strategies in prompt engineering.", product: product7)

# Course 8
file8 = URI.open("https://www.protocol.com/media-library/openai-s-logo.png?id=27994350&width=1245&height=700&quality=85&coordinates=0%2C0%2C0%2C0")
product8 = Product.new(subject: "Intro to OpenAI GPT API", description: 'Introductory course on using the OpenAI GPT API, covering API integration, understanding response formats, and leveraging GPT for various applications.', duration: "20 hours", level: "Beginner")
product8.photo.attach(io: file8, filename: "nes.png", content_type: "image/png")
product8.save!

# Course 8 - Chapters
chapter35 = Chapter.create!(title: "Introduction to OpenAI GPT API", description: "This chapter provides an introduction to the OpenAI GPT API and its capabilities.", product: product8)
chapter36 = Chapter.create!(title: "API Integration", description: "Learn how to integrate the GPT API into various applications.", product: product8)
chapter37 = Chapter.create!(title: "Understanding Response Formats", description: "Explore the different response formats provided by the GPT API.", product: product8)
chapter38 = Chapter.create!(title: "Leveraging GPT for Text Generation", description: "Understand how to use GPT for text generation and creative applications.", product: product8)
chapter39 = Chapter.create!(title: "Real-world Applications", description: "Explore real-world applications and case studies using the GPT API.", product: product8)

# Course 9
file9 = URI.open("https://cyberhoot.com/wp-content/uploads/2022/03/windows-batch-files-1024x512.jpg")
product9 = Product.new(subject: "Intro to the Command Line", description: 'Beginner-friendly course introducing the basics of the command-line interface, covering commands for navigation, file manipulation, and basic system tasks.', duration: "12 hours", level: "Beginner")
product9.photo.attach(io: file9, filename: "nes.png", content_type: "image/png")
product9.save!

# Course 9 - Chapters
chapter40 = Chapter.create!(title: "Introduction to the Command Line", description: "This chapter provides an overview of the command-line interface and its advantages.", product: product9)
chapter41 = Chapter.create!(title: "Basic Command-Line Commands", description: "Learn essential commands for navigation, file manipulation, and system tasks.", product: product9)
chapter42 = Chapter.create!(title: "Intermediate Command-Line Usage", description: "Explore more advanced command-line usage and productivity tips.", product: product9)
chapter43 = Chapter.create!(title: "Scripting and Automation", description: "Understand how to use the command line for scripting and task automation.", product: product9)
chapter44 = Chapter.create!(title: "Practical Command-Line Projects", description: "Apply command-line skills to practical projects and scenarios.", product: product9)

# Course 10
file10 = URI.open("https://blog.carbonfive.com/wp-content/uploads/2021/10/Matt-Brictson-Interview-Ruby-on-Rails.png")
product10 = Product.new(subject: "Intro to Ruby on Rails", description: 'Introductory course to Ruby on Rails, covering the basics of MVC architecture, routing, and creating simple web applications using the Ruby programming language.', duration: "25 hours", level: "Beginner")
product10.photo.attach(io: file10, filename: "nes.png", content_type: "image/png")
product10.save!

# Course 10 - Chapters
chapter45 = Chapter.create!(title: "Introduction to Ruby on Rails", description: "This chapter provides an introduction to the Ruby on Rails framework and its advantages.", product: product10)
chapter46 = Chapter.create!(title: "Understanding MVC Architecture", description: "Learn the fundamentals of Model-View-Controller architecture in Rails.", product: product10)
chapter47 = Chapter.create!(title: "Routing in Ruby on Rails", description: "Explore the routing system in Ruby on Rails for handling HTTP requests.", product: product10)
chapter48 = Chapter.create!(title: "Creating Web Applications in Rails", description: "Understand how to create simple web applications using Rails.", product: product10)
chapter49 = Chapter.create!(title: "Advanced Features and Best Practices", description: "Dive into advanced features and best practices for Ruby on Rails development.", product: product10)

# Course 11
file11 = URI.open("https://www.wilde-it.com/wp-content/uploads/2021/12/bootstrap.jpg")
product11 = Product.new(subject: "Intro to Bootstrap", description: 'Course focused on creating responsive web designs using the Bootstrap framework. Covers the basics of grid systems, components, and responsive navigation.', duration: "10 hours", level: "Beginner")
product11.photo.attach(io: file11, filename: "nes.png", content_type: "image/png")
product11.save!

# Course 11 - Chapters
chapter50 = Chapter.create!(title: "Introduction to Bootstrap", description: "This chapter provides an introduction to the Bootstrap framework and its features.", product: product11)
chapter51 = Chapter.create!(title: "Understanding Grid Systems", description: "Learn the basics of grid systems for creating responsive layouts.", product: product11)
chapter52 = Chapter.create!(title: "Bootstrap Components", description: "Explore various Bootstrap components for building web interfaces.", product: product11)
chapter53 = Chapter.create!(title: "Responsive Navigation with Bootstrap", description: "Understand how to create responsive navigation using Bootstrap.", product: product11)
chapter54 = Chapter.create!(title: "Customizing Bootstrap Themes", description: "Dive into customization options for Bootstrap themes and styles.", product: product11)

# Course 12
file12 = URI.open("https://miro.medium.com/v2/resize:fit:1400/format:webp/0*_yc86ghRrI7YYidw")
product12 = Product.new(subject: "Intro to Git & Version Control", description: 'Introductory course covering the fundamentals of Git and version control. Includes branching, merging, and collaboration workflows with Git.', duration: "6 hours", level: "Beginner")
product12.photo.attach(io: file12, filename: "nes.png", content_type: "image/png")
product12.save!

# Course 12 - Chapters
chapter55 = Chapter.create!(title: "Introduction to Version Control", description: "This chapter provides an overview of version control and its importance in software development.", product: product12)
chapter56 = Chapter.create!(title: "Git Basics", description: "Learn the fundamental concepts of Git, including repositories, commits, and branches.", product: product12)
chapter57 = Chapter.create!(title: "Branching and Merging", description: "Understand the concepts of branching and merging in Git for parallel development.", product: product12)
chapter58 = Chapter.create!(title: "Collaboration Workflows", description: "Explore collaborative workflows using Git for team-based development.", product: product12)
chapter59 = Chapter.create!(title: "Best Practices in Git", description: "Dive into best practices and tips for effective use of Git in projects.", product: product12)
