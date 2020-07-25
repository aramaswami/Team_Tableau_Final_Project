# Team_Tableau_Final_Project
# SEGMENT 1:
## PRESENTATION:

Team Tableau decided to pursue a dataset of projects. The data topic is to perform analysis on the project efficiency. Each project has many features that potentially impacts the probability of project being overbudget, such as project duration, staff members, project budget, project type, project size, etc. We are hoping to create a model that helps answer if our current projects are expected to be underbudget, with a target accuracy of 70%.<br>

Our datasource is coming from my company. All data has been encoded to maintain an appropriate level of confidentiality: removing employee names, demographic information, project names, client names; and encoding project location and personal notes. All other data is real.<br>

Since all data is real and structured, we can avoid the risk of having bad data and reduce the work for cleanup. Besides, the project not only help answer if the current project is over-budget, it can also help test a newly won project before proposing a budget and proceeding the work.

## DATABASE:
- Sample data that mimics the expected final database structure or schema: ERD map, and TB_test.csv as sample data for draft machine learning module.
- Draft machine learning module is connected to the provisional database: TB_tes.csv is connected to the draft machine learning module.

## MACHINE LEARNING MODEL:
- Takes in data in from the provisional database: taking in the TB_test.csv, then perform the draft machine learning model in TB_test notebook.
- Outputs label(s) for input data: Noted in the notebook, the output label is "Overbudget_yes" (1 for overbudget, 0 for underbudget)

## GITHUB:
Performed in other branch.
