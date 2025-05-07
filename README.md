#  Test Automation

This repository contains test cases written using **Robot Framework** for automating the signup functionality of a sample e-commerce website: [Automation Exercise](https://www.automationexercise.com/).

## Test Cases

The following test cases are implemented:

### 1. Signup With Empty Email
This test case verifies that attempting to sign up with an empty email field will show the appropriate error message.

### 2. Signup With Invalid Email Format
This test case checks the behavior when an invalid email format (e.g., missing `@`) is used to sign up.

### 3. Signup With Empty Fields
This test case validates that submitting the form with empty required fields results in an error message.

### 4. Signup With New Email
This is a positive test case where a new user signs up using a randomly generated email. The user is then able to fill in account information and successfully create an account. After the account is created, the test includes an account deletion process to ensure proper cleanup.

## Technologies Used

- **Robot Framework**: An open-source test automation framework used for acceptance testing and acceptance test-driven development (ATDD).
- **SeleniumLibrary**: A Robot Framework library used for web testing that provides a set of keywords for automating web browsers.
- **Python**: The Robot Framework uses Python as its base programming language.


