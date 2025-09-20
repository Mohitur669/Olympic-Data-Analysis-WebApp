# ---- Builder Stage ----
# Use a Red Hat Universal Base Image (UBI) with Python 3.11 for RHEL compatibility
FROM registry.access.redhat.com/ubi9/python-311 as builder

# Set the working directory
WORKDIR /opt/app

# Prevent Python from writing .pyc files and buffer logs
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Create a virtual environment for clean dependency management
RUN python -m venv /opt/venv

# Activate the virtual environment for subsequent commands
ENV PATH="/opt/venv/bin:$PATH"

# Copy the requirements file and install dependencies into the venv
# This layer is cached; it only rebuilds if requirements.txt changes
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ---- Final Stage ----
# Use the same minimal, secure RHEL base image for the final container
FROM registry.access.redhat.com/ubi9/python-311

# Create a dedicated, unprivileged user for security
RUN useradd -r -s /bin/false appuser

# Set the working directory for the final application
WORKDIR /app

# Copy the fully prepared virtual environment from the builder stage
COPY --from=builder /opt/venv /opt/venv

# Copy the entire application code and data files into the container
# The .containerignore file will ensure only necessary files are copied
COPY . .

# Activate the virtual environment
ENV PATH="/opt/venv/bin:$PATH"

# Set Streamlit-specific environment variables for production
ENV STREAMLIT_SERVER_ADDRESS=0.0.0.0
ENV STREAMLIT_SERVER_PORT=8501
ENV STREAMLIT_SERVER_HEADLESS=true

# Change ownership of the app directory to the non-root user
RUN chown -R appuser:appuser /app

# Switch to the non-root user before running the application
USER appuser

# Expose the port Streamlit will run on
EXPOSE 8501

# The command to run when the container starts
CMD ["streamlit", "run", "app.py"]
