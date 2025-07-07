//=========================Task 1: 1. Create a database named SchoolDB.
use SchoolDB;

//=========================Task 2: Create two collections: o Students o Courses
db.createCollection("Students");
db.createCollection("Courses");

//==========================Task 3:Create two collections: o Students o Courses
db.Students.insertMany([
  { "name": "Alice", "age": 20, "math": 85, "science": 90 },
  { "name": "Bob", "age": 22, "math": 78, "science": 85 },
  { "name": "Charlie", "age": 21, "math": 92, "science": 88 },
  { "name": "Daisy", "age": 19, "math": 70, "science": 75 }
]);

//==========================Task 4: Insert the following documents into the Courses collection:
db.Courses.insertMany([
  { "courseName": "Mathematics", "studentsEnrolled": [1, 2, 3], "instructor": "Dr. Smith" },
  { "courseName": "Science", "studentsEnrolled": [2, 3, 4], "instructor": "Dr. Adams" }
]);

//======================== Use findOne to retrieve: o A student where the math score is &gt;= 85 and the age is &lt; 22. o A course where the studentsEnrolled array includes 3 and the instructor is &quot;Dr. Adams&quot;.
db.Students.findOne({ math: { $gte: 85 }, age: { $lt: 22 } });
db.Courses.findOne({ studentsEnrolled: 3, instructor: "Dr. Adams" });

//===========================================6. Use find to retrieve:
//o Students with math score &gt;= 80 and science score &lt; 90.
//o Students whose age is &lt; 23 or have a math score &gt;= 85.
//o Students with science score &gt;= 80 and (either math score &lt; 75 or age &gt; 22).

db.Students.find({ math: { $gte: 80 }, science: { $lt: 90 } });
db.Students.find({ $or: [ { age: { $lt: 23 } }, { math: { $gte: 85 } } ] });
db.Students.find({ science: { $gte: 80 }, $or: [ { math: { $lt: 75 } }, { age: { $gt: 22 } } ] });

//=======================================7. Use updateOne to:
//o Increase the science score of the student where name is &quot;Bob&quot; and math score is &gt;= 75.

db.Students.updateOne(
  { name: "Bob", math: { $gte: 75 } },
  { $inc: { science: 5 } }
);

//=====================================8. Use updateMany to:
//o Increase the math score by 5 for students whose science score is &lt; 80 and age &gt; 22.
db.Students.updateMany(
  { science: { $lt: 80 }, age: { $gt: 22 } },
  { $inc: { math: 5 } }
);

//==================================9. Use deleteOne to:
//o Remove a student where name is &quot;Daisy&quot; and their science score is &lt; 80.
db.Students.deleteOne({ name: "Daisy", science: { $lt: 80 } });

//=================================10. Use deleteMany to:
//o Remove courses where the studentsEnrolled array includes 2 or the instructor is &quot;Dr. Smith&quot;.
db.Courses.deleteMany({
  $or: [ { studentsEnrolled: 2 }, { instructor: "Dr. Smith" } ]
});

//=============================11. Drop the Students collection.
db.Students.drop();

//============================12. Drop the Courses collection.
db.Courses.drop();

//============================13. Finally, delete the SchoolDB database.
db.dropDatabase();






//=======================SAMPLE TABLE======================================
db.books.insertMany([
  {
    title: "1984",
    author: "George Orwell",
    genre: "Dystopian",
    publication_year: 1949,
    rating: 4.8
  },
  {
    title: "Animal Farm",
    author: "George Orwell",
    genre: "Political Satire",
    publication_year: 1945,
    rating: 4.5
  },
  {
    title: "The Catcher in the Rye",
    author: "J.D. Salinger",
    genre: "Fiction",
    publication_year: 1951,
    rating: 4.0
  },
  {
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
    genre: "Classic",
    publication_year: 1925,
    rating: 4.3
  },
  {
    title: "Harry Potter and the Philosopher's Stone",
    author: "J.K. Rowling",
    genre: "Fantasy",
    publication_year: 1997,
    rating: 4.9
  },
  {
    title: "The Road",
    author: "Cormac McCarthy",
    genre: "Post-Apocalyptic",
    publication_year: 2006,
    rating: 4.6
  },
  {
    title: "A Brief History of Time",
    author: "Stephen Hawking",
    genre: "Science",
    publication_year: 1988,
    rating: 4.7
  }
]);


//===========================Tasks:
//Count Books by a Specific Author
// Count the number of books written by &quot;George Orwell.&quot;
db.books.countDocuments({ author: "George Orwell" });


//=======================2. Find Books Published After a Certain Year
// Retrieve all books published after the year 2000.

db.books.find({ publication_year: { $gt: 2000 } });

//=======================3. Update the Genre of a Book
// Change the genre of &quot;The Catcher in the Rye&quot; to &quot;Classic Fiction.&quot;

db.books.updateOne(
  { title: "The Catcher in the Rye" },
  { $set: { genre: "Classic Fiction" } }
);

//=======================4. Increase Rating for All Books by 0.5
// Increase the rating field of all books by 0.5 points.
db.books.find({ $text: { $search: "Great" } });

//=======================5. Find Books Matching a Keyword
// Perform a text search for books that contain the keyword &quot;Great&quot; in the title or author.
db.books.find({ $text: { $search: "Great" } });

//======================6. Sort Books by Publication Year
// Retrieve all books, sorted in descending order by publication year.
db.books.find().sort({ publication_year: -1 });

//======================7. Get the Average Publication Year by Genre
// Calculate the average publication year of books for each genre.
db.books.aggregate([
  { $group: { _id: "$genre", avgPublicationYear: { $avg: "$publication_year" } } }
]);

//======================8. Add a New Field to All Documents
// Add a new field available (boolean) set to true for all books.
db.books.updateMany({}, { $set: { available: true } });

//======================9. Delete Books Published Before a Certain Year
// Delete all books published before the year 1950.
db.books.deleteMany({ publication_year: { $lt: 1950 } });

//=====================10. List All Unique Genres
// Retrieve a list of all unique genres in the collection without duplicates.
db.books.distinct("genre");

