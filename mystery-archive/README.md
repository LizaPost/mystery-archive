## Mystery Archive: Agatha Christie Database

SQLite database project built around the books and screen adaptations of Agatha Christie. 

## Project Overview 
The database stores information about: 
- Agatha Christie books 
- Screen adaptations 
- Characters appearing in adaptations 
- Culprits 
- Book-to-adaptation relationships 
- Ratings and other related information 

One of the main goals of the project is to make it easier to explore adaptations 
when streaming services provide only a season and episode number instead of the 
original adaptation title. 
For instance, you can answer questions such as: 
- Which books have been adapted? 
- Which books do not have an adaptation? 
- Which adaptation corresponds to a particular season and episode? 
- Which adaptations feature Hercule Poirot / Miss Marple? 
- Which episodes include Captain Hastings, Inspector Japp, or Miss Lemon? 
- Who is the culprit? 

## Database Structure
The database uses a relational design with separate tables for books, adaptations, 
characters, culprits, and their relationships. 
Many-to-many relationships are represented using junction tables. 

## Getting Started 
Requirements: 
- SQLite
- SQLite editor or SQLite-compatible database tool 

Setup: 
1. Clone the repository
2. Create the SQLite database: run <sqlite3 database/mystery_archive.db> 
3. Run the setup script from SQlite prompt: run <.read setup.sql> 

The setup script creates database tables, imports data from csv files, creates views and indexes. 

## Explore the Database
In queries.sql, you can write and run your queries. 
For instance, to see a streaming-friendly Poirot episode guide, run the view: 
SELECT * FROM poirot_episode_guide; 

Have fun!