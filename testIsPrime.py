import unittest
from prime import is_prime  # assuming your function is in a file named prime.py

class TestIsPrime(unittest.TestCase):
    def test_negative_number(self):
        self.assertFalse(is_prime(-1))

    def test_zero(self):
        self.assertFalse(is_prime(0))

    def test_one(self):
        self.assertFalse(is_prime(1))

    def test_two(self):
        self.assertTrue(is_prime(2))

    def test_prime_number(self):
        self.assertTrue(is_prime(7))

    def test_composite_number(self):
        self.assertFalse(is_prime(4))

    def test_large_prime_number(self):
        self.assertTrue(is_prime(104729))  # 104729 is the 10000th prime number

    def test_large_composite_number(self):
        self.assertFalse(is_prime(100000))

if __name__ == '__main__':
    unittest.main()