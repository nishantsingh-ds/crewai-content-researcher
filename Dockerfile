FROM python:3.12-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y sqlite3 libsqlite3-dev && \
    apt-get clean

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Set the working directory
WORKDIR /app
COPY . /app

# Run the Streamlit app
CMD ["streamlit", "run", "streamlit_app.py"]
