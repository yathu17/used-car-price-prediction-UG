from flask import Flask, request, jsonify
import joblib
import numpy as np

# Initialize Flask app
app = Flask(__name__)

# Load the trained model
model = joblib.load('Random_Forest_model.pkl')

@app.route('/predict', methods=['POST'])
def predict():
    # Get the data from the POST request
    data = request.get_json(force=True)
    
    # Extract features from the request data
    input_data = np.array([
        data['title'],
        data['Mileage(miles)'],
        data['Registration_Year'],
        data['Previous Owners'],
        data['Fuel type'],
        data['Body type'],
        data['Engine'],
        data['Gearbox'],
        data['Doors'],
        data['Seats'],
        data['Emission Class']
    ])

    # Make prediction
    prediction = model.predict(input_data.reshape(1, -1))

    # Return the prediction as a JSON response
    return jsonify({'price': prediction[0]})

if __name__ == '__main__':
    app.run(debug=True)
