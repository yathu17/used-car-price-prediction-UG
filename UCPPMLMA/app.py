from flask import Flask, request, jsonify
import joblib
import pandas as pd

app = Flask(__name__)

# Load the trained model
model_filename = 'Random_Forest_model.pkl'
model = joblib.load(model_filename)

# Update the feature list to include all features used during training
features = [
    'Mileage(miles)', 'Registration_Year', 'Previous Owners',
    'Fuel type', 'Body type', 'Engine', 'Gearbox', 'Doors', 'Seats',
    'Emission Class'
]

@app.route('/predict', methods=['POST'])
def predict():
    data = request.get_json(force=True)
    df = pd.DataFrame(data, index=[0])
    
    # Ensure the dataframe contains all the required features
    for feature in features:
        if feature not in df.columns:
            df[feature] = 0
    
    prediction = model.predict(df[features])[0]
    
    return jsonify({'predicted_price': prediction})

if __name__ == '__main__':
    app.run(debug=True)
