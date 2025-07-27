# Power Consumption Prediction for Tétouan, Morocco

##  Mission: Smart Resource Management for a Sustainable Future
In a world where energy efficiency is not just an option but a necessity, my mission is to harness the power of data science to optimize energy consumption in Tétouan, Morocco. By predicting power usage patterns with high accuracy, we empower city planners and energy providers to make data-driven decisions that reduce waste, lower costs, and contribute to a more sustainable urban future.

##  Project Overview
This project leverages machine learning to predict power consumption across Tétouan's three distribution zones (Quads, Smir, and Boussafou), using historical energy and weather data collected every 10 minutes.

###  Key Objectives
- Predict power consumption with over 97% accuracy  
- Identify key factors influencing energy usage  
- Enable proactive energy distribution planning  
- Support Morocco's transition to sustainable energy practices  

##  Dataset
- **Source**: [Kaggle - Electric Power Consumption](https://www.kaggle.com/datasets/fedesoriano/electric-power-consumption)  
- **Time Period**: January - December 2017  
- **Update Frequency**: Every 10 minutes  
- **Total Observations**: 52,416  

### Features
- `Datetime`: 10-minute intervals  
- `Temperature`: Weather temperature in °C  
- `Humidity`: Relative humidity percentage  
- `WindSpeed`: Wind speed in km/h  
- `GeneralDiffuseFlows`: Diffuse solar radiation  
- `DiffuseFlows`: Additional diffuse radiation measurements  
- `Zone 1/2/3 Power Consumption`: Power usage in kW for each distribution zone  

##  Technical Implementation

### Model Performance (Random Forest)
- **R² Score**: 0.98  
- **Mean Absolute Error (MAE)**: 710.22 kW  
- **Root Mean Squared Error (RMSE)**: 1,060.64 kW  

### Project Structure
```
power-consumption-api/
├── app/                # FastAPI application
│   ├── models/         # ML models and scalers
│   └── main.py         # API endpoints
├── notebooks/          # Jupyter notebooks for analysis
├── tests/              # Test cases
├── requirements.txt    # Python dependencies
└── Dockerfile          # Container configuration
```

##  Getting Started

### Prerequisites
- Python 3.8+  
- pip (Python package manager)  

### Installation
```bash
# Clone the repository
git clone https://github.com/denismitali17/linear_regression.git
cd power-consumption-api

# Create and activate virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### Making Predictions
```python
import joblib
import pandas as pd

# Load model and scaler
model = joblib.load('app/models/power_consumption_model.joblib')
scaler = joblib.load('app/models/scaler.pkl')

# Example input
input_data = {
    'Temperature': 25.5,
    'Humidity': 60.0,
    'WindSpeed': 10.0,
    'GeneralDiffuseFlows': 0.5,
    'DiffuseFlows': 0.3,
    'Hour': 14,
    'DayOfWeek': 2,  
    'Month': 6
}

# Preprocess and predict
input_df = pd.DataFrame([input_data])
input_scaled = scaler.transform(input_df)
prediction = model.predict(input_scaled)
print(f"Predicted consumption: {prediction[0]:.2f} kW")
```

###  API Usage

#### Local Development
```bash
uvicorn app.main:app --reload
```

#### Example API Request
```python
import requests

url = "http://localhost:8000/docs"
response = requests.post(url, json=input_data)
print(response.json())
```

# Youtube Video
Link: https://youtu.be/BLVcfFaVjME

##  Results & Insights
**Best Performing Model**: Random Forest Regressor (R² = 0.98)

**Key Predictors**:
- Time of day (35% impact)  
- Temperature (25% impact)  
- Month (15% impact)  
- Other weather conditions (25% combined)  

##  References
- Salam, Abdul Rahim and Abdelaaziz El Hibaoui. "Comparison of Machine Learning Algorithms for the Power Consumption Prediction: Case Study of Tetouan city"  
- Fedesoriano. (2022). Electric Power Consumption Dataset. Kaggle.  

##  Contact
**Name**: Denis Mitali  
**Email**: d.mitali1@alustudent.com  
**Project Link**: [GitHub Repository](https://github.com/denismitali17/linear_regression)  


> Empowering Tétouan's energy future through data science and machine learning.
