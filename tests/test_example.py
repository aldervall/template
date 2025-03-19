"""
Tests for the example module.
"""

import pytest
from mypackage.example import add_numbers, greet


def test_add_numbers():
    """Test the add_numbers function."""
    # Test with positive numbers
    assert add_numbers(1, 2) == 3
    
    # Test with negative numbers
    assert add_numbers(-1, -2) == -3
    
    # Test with zero
    assert add_numbers(0, 0) == 0
    
    # Test with mixed numbers
    assert add_numbers(-5, 10) == 5


def test_greet():
    """Test the greet function."""
    # Test with default parameter
    assert greet() == "Hello, World!"
    
    # Test with custom name
    assert greet("Python") == "Hello, Python!"
    
    # Test with empty string
    assert greet("") == "Hello, !"


def test_greet_with_fixture(monkeypatch):
    """Test the greet function with a pytest fixture."""
    # This is an example of using pytest fixtures
    # The monkeypatch fixture allows you to modify objects during a test
    
    # Create a mock function to replace the original greet function
    def mock_greet(name="World"):
        return f"Bonjour, {name}!"
    
    # Replace the original function with our mock
    monkeypatch.setattr("mypackage.example.greet", mock_greet)
    
    # Import the function again to get the patched version
    from mypackage.example import greet
    
    # Test the patched function
    assert greet() == "Bonjour, World!"
    assert greet("Python") == "Bonjour, Python!"


if __name__ == "__main__":
    # This allows running the tests with python tests/test_example.py
    pytest.main(["-v"])
