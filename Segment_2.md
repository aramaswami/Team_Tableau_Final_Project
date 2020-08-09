✓ Description of the data exploration
phase of the project
✓ Description of the analysis phase of
the project

# Description of the data exploration phase
The dataset contains 4 tables: building, project, hours, and employees. Each table has many columns. For the scope of the project, we only need a few of them, so the first step was to remove any columns we do not use. Then we remove any null/NaN data. The model output "overbudget_yes" is supposed to be boolean, so we need to remove any records showing "No conclusion!". Last but not least, we just need to convert the data types, mostly for the date columns, and rename all columns for easier tracking and analysis. After that, all tables are ready to import to our SQL database.

In the SQL database, we merge the project table with the building table in order to extract the building information for each project, and merge the hours with employees in order to get the employee region for each hour entry. Our initial idea was to see the employee region proportion in each project. However, after exploring the data, many projects are executed by either only one employee, or only in one region. Therefore, using the employee region proportion feature might make the model overfitting, so we decided to remove this one. That being said, our final list of the features will be as follow: service line, project tema, project manager, budget, building region location, project having a NDA (non-disclosure agreement), total number of hours spent on the project, total number of employee working on the project, and project month duration.

# Description of the analysis phase of the project
Even though the data is fairly clean, we still need to preprocess the data before plugging in the model. That includes summing the number of hours from the hour table to the project, calculating the project month duration using the first date/last date of the hours table and the project end date, and counting the number of employees working on each project. After that, the data is cleaned and ready for one-hot-coding, scaled, and plugged in the model.

# Dashboard: description of the interactive element(s)
The dashboard will take some input parameters from the end user, such as project budget, duration, number of employees, estimated project manager, estimated hours, etc. Then we would have python to plug in all those parameters, apply to our trained model, and return a prediction if the project is expected to be overbudget or not, with the accuracy goal to be higher than 70%.