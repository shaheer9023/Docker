FROM python:3.12-slim

# Install uv package manager
RUN pip install uv

# Set working directory
WORKDIR /work

# Step 1: Copy dependency files FIRST (for cache optimization)
COPY pyproject.toml uv.lock ./

# Step 2: Install dependencies (this layer will be cached)
RUN uv sync --frozen

# Step 3: Copy application code AFTER (changes frequently)
COPY main.py ./

# Expose port
EXPOSE 8000

# Run the application
CMD ["uv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]