# Power Consumption Prediction for Tétouan, Morocco

## Project Overview
This project implements machine learning models to predict power consumption across three zones in Tétouan, Morocco, using historical energy and weather data.

## Dataset
- **Source**: https://www.kaggle.com/datasets/fedesoriano/electric-power-consumption
- **Time Period**: January 2017 - December 2017
- **Update Frequency**: Every 10 minutes
- **Features**: Temperature, Humidity, Wind Speed, General Diffuse Flows, Diffuse Flows, and temporal features

## Project Structure
power-consumption-prediction/
├── data/
│   └── powerconsumption.csv
├── models/
│   ├── power_consumption_model.pkl
│   └── scaler.pkl
├── notebooks/
│   └── power_consumption_analysis.ipynb
├── README.md
└── requirements.txt

## Installation
```bash
git clone https://github.com/denismitali17/linear_regression.git
cd power-consumption-prediction
python -m venv venv
source venv/bin/activate  
pip install -r requirements.txt
```

## Usage

### Run the Jupyter Notebook:
```bash
jupyter notebook notebooks/power_consumption_analysis.ipynb
```

### Make Predictions:
```python
import joblib
import pandas as pd

# Load model and scaler
model = joblib.load('models/power_consumption_model.pkl')
scaler = joblib.load('models/scaler.pkl')

# Example input
input_data = {
    'Temperature': 25.5,
    'Humidity': 60.0,
    'WindSpeed': 10.0,
    'GeneralDiffuseFlows': 0.5,
    'DiffuseFlows': 0.3,
    'Hour': 14,
    'DayOfWeek': 2,  # Tuesday
    'Month': 6
}

# Preprocess and predict
input_df = pd.DataFrame([input_data])
input_scaled = scaler.transform(input_df)
prediction = model.predict(input_scaled)
print(f"Predicted consumption: {prediction[0]:.2f} kW")
```

## Models

- **Linear Regression with SGD**
  - Learning rate scheduling
  - Early stopping
  - L2 regularization

- **Decision Tree Regressor**
  - Handles non-linear relationships
  - Feature importance visualization

- **Random Forest Regressor (Best Performing)**
  - Ensemble of decision trees
  - Reduced overfitting

## Results

Best model performance (Random Forest):
- MAE: 710.22 kW
- RMSE: 1060.64 kW
- R² Score: 0.9777

## Visualization
The notebook includes:
- Time series analysis
- Correlation heatmap
- Feature importance
- Learning curves
- Regression plots

## API Example
```python
import requests

url = 
response = requests.post(url, json=input_data)
print(response.json())
```

## Requirements
- Python 3.8+
- pandas
- numpy
- scikit-learn
- matplotlib
- seaborn
- jupyter
- joblib


## Contact
Denis Mitali - d.mitali1@alustudent.com 
Project Link: https://github.com/denismitali17/linear_regression
