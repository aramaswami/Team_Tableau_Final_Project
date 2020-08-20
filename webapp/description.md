# Technologies, languages, tools, and algorithms used throughout the project

The project used many python libraries, such as pandas, numpy, and sqlalchemy to process the raw data ETL, and load it to our local SQL Database. We had 4 raw tables, but were able to join them into 2 tables using SQL query, and use them for the machine learning model.

Before building the model, we still need to preprocess the 2 tables using sklearn library, to one-hot-encode and scale the data. After that, we applied a few machine learning models, and SVM returned the highest accuracy score for us (more than 70%). Lastly, we used the pickle library to export the model to use later.

To build the interactive dashboard, we use Flask app with python. The app will load the saved model above, collect the end-user input, then apply that input into the model and return the result back to the end user.
