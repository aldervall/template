# Contributing to This Project

Thank you for your interest in contributing to this project! This document provides guidelines and instructions for contributing.

## Code of Conduct

Please be respectful and considerate of others when contributing to this project. We aim to foster an inclusive and welcoming community.

## Getting Started

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/your-username/template.git
   cd template
   ```
3. Set up the development environment:
   ```bash
   chmod +x setup.sh
   ./setup.sh
   pip install -e .
   pre-commit install
   ```

## Development Workflow

1. Create a new branch for your feature or bugfix:
   ```bash
   git checkout -b feature/your-feature-name
   ```
   or
   ```bash
   git checkout -b fix/issue-you-are-fixing
   ```

2. Make your changes and commit them with clear, descriptive commit messages:
   ```bash
   git add .
   git commit -m "Add feature X" 
   ```

3. Push your branch to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

4. Open a pull request from your fork to the main repository

## Development Guidelines

### Code Style

This project uses several tools to ensure code quality:

- **Black** for code formatting
- **isort** for import sorting
- **flake8** for linting
- **mypy** for type checking

You can run all of these checks with:
```bash
make lint
```

And automatically format your code with:
```bash
make format
```

### Testing

All new features should include tests. This project uses pytest for testing.

Run the tests with:
```bash
make test
```

### Documentation

- Document all public functions, classes, and modules
- Use docstrings that follow the Google style guide
- Update the README.md if necessary

### Commit Messages

- Use clear, descriptive commit messages
- Start with a verb in the present tense (e.g., "Add feature X", "Fix bug Y")
- Reference issue numbers if applicable (e.g., "Fix #123: Add feature X")

## Pull Request Process

1. Ensure your code passes all tests and linting checks
2. Update documentation if necessary
3. Make sure your commits are clean and focused
4. Submit the pull request with a clear description of the changes and any relevant issue numbers

## Release Process

The maintainers will handle the release process, including:

1. Updating the version number
2. Creating a new release on GitHub
3. Publishing to PyPI (if applicable)

## Questions?

If you have any questions or need help, please open an issue on GitHub.

Thank you for contributing!
