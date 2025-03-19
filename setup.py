"""
Setup script for backward compatibility.

This file is kept for backward compatibility with tools that don't
support pyproject.toml yet. All configuration is in pyproject.toml.
"""

from setuptools import setup

# This setup.py file is just a shim that defers to pyproject.toml
setup()
