FROM python:3.7.4

# avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Jupyter Notebook
RUN pip install jupyter

RUN pip install tensorflow==2.1.0
RUN pip install keras==2.3.1
RUN pip install matplotlib==3.1.1

# ran into error, and this fixed it.
RUN pip install protobuf==3.20.*

# Set up a working directory
WORKDIR /workspace

# Expose the Jupyter Notebook port
EXPOSE 8888

# Run Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
