# Team_Tableau_Final_Project Dashboard
A brief recap of our work to date on the final project:
- We used several python libraries including: pandas, numpy, sqlalchemy to process the raw data ETL, and load it to our local SQL Database.
- We had 4 raw tables, but were able to join them into 2 tables using SQL query, and use them for the machine learning model.
- Before building the model, we preprocessed the 2 tables using sklearn library, to one-hot-encode and scale the data.
- Following pre processing, we applied different machine learning models to test how well they performed. For our data, SVM returned the highest accuracy score (greater than 70%).

The main task for the third submission was our work on visualization and dashboard. Following is a summary of or work.
- We exported our ML model with the pickle library so it can be applied to new user-provided data.
- We developed a Flask application with python to enable an interactive query of the model with new data and get a prediction.
- The app loads the saved model, collects user input, feeds the input to the ML model, and returns a result to user.
