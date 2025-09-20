# ---- Builder Stage ----
# Use Red Hat UBI 9 Python 3.11 for RHEL compatibility
FROM registry.access.redhat.com/ubi9/python-311 as builder

# Set working directory inside container
WORKDIR /app

# Prevent Python from writing .pyc files and buffer logs
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create a virtual environment inside /app (writable in rootless mode)
RUN python -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# ---- Final Stage ----
FROM registry.access.redhat.com/ubi9/python-311

# Set working directory
WORKDIR /app

# Copy venv and app code from builder stage
COPY --from=builder /app/venv /app/venv
COPY --from=builder /app /app

# Activate virtual environment
ENV PATH="/app/venv/bin:$PATH"

# Set Streamlit production environment variables
ENV STREAMLIT_SERVER_ADDRESS=0.0.0.0
ENV STREAMLIT_SERVER_PORT=8501
ENV STREAMLIT_SERVER_HEADLESS=true
ENV STREAMLIT_SERVER_ENABLE_XSRF_PROTECTION=false

# Expose Streamlit port
EXPOSE 8501

# Command to run Streamlit
CMD ["streamlit", "run", "app.py"]
