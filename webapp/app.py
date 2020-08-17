# To run flask, use cmd shell. Make sure it's on Anaconda PythonData, and on the correct folder
# Then: set FLASK_APP=app.py
	# 	set FLASK_ENV=development
# Then: flask run

from flask import Flask, render_template, request, redirect, url_for
import numpy as np
import pandas as pd
import pickle
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.model_selection import train_test_split
from numpy import loadtxt
# Create a StandardScaler instance
scaler = StandardScaler()

# Build functions:
def standard_scaling(clean_df):
    # dropna
    dropna_df = clean_df.dropna().reset_index(drop=True)
    # one-hot-encode
    test_list = ["project_manager","service_line", "team", "building_region","nda"]
        # Create a OneHotEncoder instance
    enc = OneHotEncoder(sparse=False)
        # Fit and transform the OneHotEncoder using the categorical variable list
    encode_df = pd.DataFrame(enc.fit_transform(dropna_df[test_list]))
        # Add the encoded variable names to the dataframe
    encode_df.columns = enc.get_feature_names(test_list)
        # Merge one-hot encoded features and drop the originals
    merge_df = dropna_df.merge(encode_df,left_index=True, right_index=True)
    merge_df = merge_df.drop(test_list,1)
    merge_df = merge_df.drop(columns=['project_id'])
    
    # Get X and y:
    y = merge_df.overbudget_yes.values
    X = merge_df.drop(columns=["overbudget_yes"]).values

    # Split training/test datasets
    X_train, X_test, y_train, y_test = train_test_split(X, y, random_state=42, stratify=y)

    # Fit the StandardScaler
    X_scaler = scaler.fit(X_train)
    
    return X_scaler, X_test

def process_input(user_input):
    copy_df = clean_df
    # append input row:
    copy_df.loc[len(copy_df)] = user_input
    # dropna
    dropna_df = copy_df.dropna().reset_index(drop=True)
    # one-hot-encode
    test_list = ["project_manager","service_line", "team", "building_region","nda"]
        # Create a OneHotEncoder instance
    enc = OneHotEncoder(sparse=False)
        # Fit and transform the OneHotEncoder using the categorical variable list
    encode_df = pd.DataFrame(enc.fit_transform(dropna_df[test_list]))
        # Add the encoded variable names to the dataframe
    encode_df.columns = enc.get_feature_names(test_list)
        # Merge one-hot encoded features and drop the originals
    merge_df = dropna_df.merge(encode_df,left_index=True, right_index=True)
    merge_df = merge_df.drop(test_list,1)
    merge_df = merge_df.drop(columns=['project_id','overbudget_yes'])
    
    # Get the last row for prediction
    last_row = merge_df.tail(1).values
    
    # append last row to X_test array:
    new_X_test = np.append( X_test , last_row , axis=0)
        
    # Scale the data
    X_test_scaled = X_scaler.transform(new_X_test)
    
    # Apply to the ML model:
    prediction = model.predict(X_test_scaled)
    
    # Prediction of the last row:
    result = prediction[-1]
    
    return result


# Use pickle to load in the pre-trained model.
with open('model\ml_deploy.pkl', 'rb') as f:
    model = pickle.load(f)
    # load array
X_test_scaled = loadtxt('model\X_test_scaled.csv', delimiter=',')
y_test = loadtxt('model\y_test.csv', delimiter=',')
    # Calculate the Score 
score = model.score(X_test_scaled, y_test) * 100

# Import clean_df dataset and build scaler and X_test:
clean_df = pd.read_csv('static\data\cleaned_input.csv') 
X_scaler, X_test = standard_scaling(clean_df)

# First message:
message = f'Our current model has an accuracy score of {score:.2f}%. Please enter all data then press Run to view the prediction result.'

# create a new app Instance (a singular version of something):
app = Flask(__name__)

# Define the starting point , aka the root
@app.route('/', methods=["GET", "POST"]) # methods GET and POST to store user input
def index(): 
    if request.method == "POST":        
        user_input = []
        # collect data:
        req = request.form
        prj_name = req["prj_name"]
        service_line = req["service_line"]
        team = req["team"]
        project_manager = int(req["project_manager"])
        budget_input = float(req["budget"])
        region = req["region"]
        nda = bool(req["nda"])
        hours = float(req["hours"])
        emp_count = int(req["emp_count"])
        duration = float(req["duration"])
        # append to array:
        user_input = ['user input', service_line, team, project_manager, 0, budget_input, region, nda, hours, emp_count, duration]
        print(user_input)

        # prediction:
        prediction = process_input(user_input)

        # result message:
        if prediction == 0:
            result_mess = f'Your project {prj_name}  has {score:.2f}% chance to be Over-budget.'
        else:
            result_mess = f'Congratulations! Your project {prj_name} has {score:.2f}% chance to be Under-budget.'

        return render_template("index.html", result = result_mess)
    return render_template("index.html", result = message) # return an HTML template using an index.html file

if __name__ == "__main__":
   app.run( debug = True)