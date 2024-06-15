# from flask import Flask, request, jsonify
# import joblib
# import pandas as pd

# # Initialize Flask app
# app = Flask(__name__)

# # Load the trained model
# model_filename = 'Random_Forest_model.pkl'
# model = joblib.load(model_filename)

# # Define the prediction endpoint
# @app.route('/predict', methods=['POST'])
# def predict():
#     # Get data from the POST request
#     data = request.get_json(force=True)
    
#     # Convert data into a dataframe
#     df = pd.DataFrame(data, index=[0])
    
#     # Ensure the order of columns matches the training data
#     features = ['title','Mileage(miles)', 'Registration_Year', 'Previous Owners', 'Fuel type', 
#                 'Body type', 'Engine', 'Gearbox', 'Doors', 'Seats', 
#                 'Emission Class']
    
#     # Check if all required features are present
#     for feature in features:
#         if feature not in df.columns:
#             return jsonify({'error': f'Missing feature: {feature}'}), 400

#     # Predict using the model
#     prediction = model.predict(df[features])[0]
    
#     # Return the prediction as JSON
#     return jsonify({'predicted_price': prediction})

# # Run the Flask app
# if __name__ == '__main__':
#     app.run(debug=True)




from flask import Flask, request, jsonify  # Importing Flask and necessary modules
import joblib  # Importing joblib to load the trained model
import pandas as pd  # Importing pandas for data manipulation

# Initialize Flask app
app = Flask(__name__)

# Load the trained model
model_filename = 'Random_Forest_model.pkl'  # Filename of the saved model
model = joblib.load(model_filename)  # Loading the model from the file

# Define the prediction endpoint
@app.route('/predict', methods=['POST'])
def predict():
    # Get data from the POST request
    data = request.get_json(force=True)  # Parsing JSON data from the request

    # Convert data into a dataframe
    df = pd.DataFrame(data, index=[0])  # Creating a dataframe from the input data

    # Ensure the order of columns matches the training data
    features = ['title','Mileage(miles)', 'Registration_Year', 'Previous Owners', 'Fuel type', 
                'Body type', 'Engine', 'Gearbox', 'Doors', 'Seats', 
                'Emission Class']  # List of features expected by the model

    # Check if all required features are present
    for feature in features:
        if feature not in df.columns:
            return jsonify({'error': f'Missing feature: {feature}'}), 400  # Return an error if any feature is missing

    # Predict using the model
    prediction = model.predict(df[features])[0]  # Making a prediction with the model
    
    # Return the prediction as JSON
    return jsonify({'predicted_price': prediction})  # Returning the prediction in JSON format

# Run the Flask app
if __name__ == '__main__':
    app.run(debug=True)  # Running the Flask app in debug mode
