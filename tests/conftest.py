"""
Shared pytest fixtures for all tests.

This file contains fixtures that can be used across multiple test files.
Pytest automatically discovers and makes these fixtures available to all tests.
"""

import pytest
from pathlib import Path
import sys

# Add the src directory to the Python path so that the package can be imported
# This is needed when running tests directly with pytest
src_path = Path(__file__).parent.parent / "src"
sys.path.insert(0, str(src_path))


@pytest.fixture
def sample_data():
    """
    A fixture that provides sample data for tests.
    
    Returns:
        dict: A dictionary with sample data
    """
    return {
        "numbers": [1, 2, 3, 4, 5],
        "strings": ["apple", "banana", "cherry"],
        "nested": {
            "a": 1,
            "b": 2,
            "c": 3
        }
    }


@pytest.fixture
def temp_file(tmp_path):
    """
    A fixture that creates a temporary file for testing.
    
    Args:
        tmp_path: Built-in pytest fixture that provides a temporary directory
        
    Returns:
        Path: Path to the temporary file
    """
    file_path = tmp_path / "test_file.txt"
    file_path.write_text("This is a test file.\nIt has multiple lines.\n")
    return file_path
