# Git Repository Template

A simple Git repository template for developers who don't use Git frequently. This template includes automated setup for Python development with uv and direnv, along with simplified Git operations.

## Features

- Automated setup script for development environment
- Python virtual environment management with uv
- Automatic environment activation with direnv
- Simplified Git backup script for easy commits and pushes
- Best practices for Git repositories

## Getting Started

### Initial Setup

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd template
   ```

2. Make the scripts executable:
   ```bash
   chmod +x setup.sh git-backup.sh
   ```

3. Run the setup script:
   ```bash
   ./setup.sh
   ```
   This will:
   - Install uv (Python package manager) if not already installed
   - Install direnv if not already installed
   - Create a Python virtual environment (.venv)
   - Set up a .envrc file for automatic environment activation

4. Configure your Git remote (if not already done):
   ```bash
   git remote add origin <your-repository-url>
   ```

## Using uv (Python Package Manager)

[uv](https://github.com/astral-sh/uv) is a fast Python package installer and resolver.

### Basic uv Commands

- Install packages:
  ```bash
  uv pip install <package-name>
  ```

- Install packages from requirements.txt:
  ```bash
  uv pip install -r requirements.txt
  ```

- Create a requirements.txt file:
  ```bash
  uv pip freeze > requirements.txt
  ```

- Update packages:
  ```bash
  uv pip install --upgrade <package-name>
  ```

## Using direnv

[direnv](https://direnv.net/) automatically loads and unloads environment variables depending on the current directory.

- The included .envrc file automatically activates the Python virtual environment when you enter the directory
- Any changes to the .envrc file require approval with `direnv allow`
- Add custom environment variables by editing the .envrc file

## Basic Git Commands

### Essential Git Commands

- Check status of your repository:
  ```bash
  git status
  ```

- View commit history:
  ```bash
  git log
  ```

- Create a new branch:
  ```bash
  git checkout -b <branch-name>
  ```

- Switch to an existing branch:
  ```bash
  git checkout <branch-name>
  ```

- Pull latest changes from remote:
  ```bash
  git pull origin <branch-name>
  ```

### Using the Git Backup Script

The included `git-backup.sh` script simplifies the process of adding, committing, and pushing changes.

- Basic usage (uses default commit message with timestamp):
  ```bash
  ./git-backup.sh
  ```

- With custom commit message:
  ```bash
  ./git-backup.sh "Added new feature X"
  ```

- Get help:
  ```bash
  ./git-backup.sh --help
  ```

## Git Best Practices

1. **Commit Often**: Make small, focused commits that address a single issue or feature
2. **Write Good Commit Messages**: Use clear, descriptive commit messages
3. **Pull Before Push**: Always pull the latest changes before pushing to avoid conflicts
4. **Use Branches**: Create branches for new features or bug fixes
5. **Review Changes Before Committing**: Use `git diff` or `git status` to review changes
6. **Use .gitignore**: Keep your repository clean by ignoring unnecessary files

## Customizing This Template

Feel free to customize this template for your specific needs:

- Add project-specific dependencies to the setup script
- Modify the .envrc file to include additional environment variables
- Update the README with project-specific information
- Add additional scripts or configuration files as needed

## License

This template is available under the MIT License. See the LICENSE file for details.
