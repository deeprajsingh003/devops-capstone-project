"""
Microservice initialization
"""
from flask import Flask
from flask_talisman import Talisman

# Initialize the Flask application
app = Flask(__name__)

# Configure Talisman security headers
talisman = Talisman(app)

# Import the routes after the app is created to avoid circular dependencies
from service import routes, models
