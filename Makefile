.PHONY: setup test lint format clean build install

# Default target
all: test lint

# Setup the development environment
setup:
	./setup.sh
	pip install -e .
	pre-commit install

# Run tests
test:
	pytest

# Run linters
lint:
	flake8 src tests
	mypy src tests
	black --check src tests
	isort --check src tests

# Format code
format:
	black src tests
	isort src tests

# Clean build artifacts
clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	find . -type f -name "*.pyd" -delete
	find . -type f -name ".coverage" -delete
	find . -type d -name "*.egg" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".coverage" -exec rm -rf {} +
	find . -type d -name "htmlcov" -exec rm -rf {} +

# Build package
build: clean
	python -m build

# Install the package
install:
	pip install .

# Help target
help:
	@echo "Available targets:"
	@echo "  setup    - Set up the development environment"
	@echo "  test     - Run tests"
	@echo "  lint     - Run linters"
	@echo "  format   - Format code"
	@echo "  clean    - Clean build artifacts"
	@echo "  build    - Build the package"
	@echo "  install  - Install the package"
	@echo "  all      - Run tests and linters (default)"
	@echo "  help     - Show this help message"
