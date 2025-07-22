from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from .models.prediction_model import PredictionModel
from .models.schemas import PowerConsumptionInput, PowerConsumptionOutput
import uvicorn
import os

app = FastAPI(
    title="Power Consumption Prediction API",
    description="API for predicting power consumption in Tétouan, Morocco",
    version="1.0.0",
    docs_url="/docs",
    redoc_url="/redoc"
)

# CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # In production, replace with your frontend URL
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Initialize model
try:
    prediction_model = PredictionModel()
except Exception as e:
    raise RuntimeError(f"Failed to initialize prediction model: {str(e)}")

@app.get("/")
async def root():
    return {
        "message": "Welcome to Power Consumption Prediction API",
        "docs": "/docs",
        "version": "1.0.0"
    }

@app.post("/predict", response_model=PowerConsumptionOutput)
async def predict_power_consumption(input_data: PowerConsumptionInput):
    """
    Predict power consumption based on input features.
    
    - **Temperature**: Temperature in Celsius (-20 to 50)
    - **Humidity**: Humidity percentage (0-100)
    - **WindSpeed**: Wind speed in km/h (0-100)
    - **GeneralDiffuseFlows**: General diffuse flows (0-1)
    - **DiffuseFlows**: Diffuse flows (0-1)
    - **Hour**: Hour of day (0-23)
    - **DayOfWeek**: Day of week (0-6, where 0 is Monday)
    - **Month**: Month (1-12)
    """
    return prediction_model.predict(input_data)

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8000))
    uvicorn.run("app.main:app", host="0.0.0.0", port=port, reload=True)