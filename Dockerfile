FROM python:3.7.13-stretch

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY . app.py /app/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN python 3.7 pip install --upgrade pip &&\
    python 3.7 pip install --trusted-host pypi.python.org -r requirements.txt

# Expose port 80
EXPOSE 8000

# Run app.py at container launch
CMD ["python", "app.py"]
