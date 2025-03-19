"""
Example module with a simple function.

This is a template module that you can use as a starting point.
"""


def add_numbers(a: int, b: int) -> int:
    """
    Add two numbers together and return the result.

    Args:
        a: First number
        b: Second number

    Returns:
        The sum of a and b
    """
    return a + b


def greet(name: str = "World") -> str:
    """
    Return a greeting message.

    Args:
        name: The name to greet (default: "World")

    Returns:
        A greeting message
    """
    return f"Hello, {name}!"


if __name__ == "__main__":
    # Example usage
    result = add_numbers(5, 7)
    print(f"5 + 7 = {result}")
    
    message = greet("Developer")
    print(message)
